#!/usr/bin/env bash
# ------------------------------------------------------------
# NordVPN Waybar Status Script
#
# This script queries the NordVPN CLI and outputs the connection
# status in JSON format for consumption by Waybar's custom module.
#
# Display format:
#   VPN: <Country>-<City> up   (when connected)
#   VPN: down                  (when disconnected or unavailable)
#
# Requirements:
#   - nordvpn CLI available in PATH
#   - Waybar custom module with "return-type": "json"
#
# Author: Takumi Yamada
# Repository: https://github.com/takumiymd/waybar-nordvpn
# ------------------------------------------------------------

set -euo pipefail

# Static text prefix displayed in the Waybar status bar
PREFIX="VPN:"

# Fallback indicator for unexpected error states
ERROR_MARK="!!"

# ------------------------------------------------------------
# Escapes a string for safe inclusion in JSON output.
# This prevents malformed JSON caused by quotes or newlines.
# ------------------------------------------------------------
json_escape() {
  python3 - <<'PY' "$1"
import json, sys
print(json.dumps(sys.argv[1]))
PY
}

# ------------------------------------------------------------
# Verify that the NordVPN CLI is installed and accessible.
# If not available, return a safe "down" state instead of failing.
# ------------------------------------------------------------
if ! command -v nordvpn >/dev/null 2>&1; then
  text="${PREFIX} down"
  tooltip="NordVPN CLI not found in PATH."
  printf '{"text":%s,"class":"error","tooltip":%s}\n' \
    "$(json_escape "$text")" "$(json_escape "$tooltip")"
  exit 0
fi

# ------------------------------------------------------------
# Query NordVPN status.
# Any CLI error is captured to avoid breaking Waybar.
# ------------------------------------------------------------
status_output="$(nordvpn status 2>&1 || true)"

# Extract connection status (Connected / Disconnected)
connection_state="$(printf '%s\n' "$status_output" | awk -F': ' '/^Status:/{print $2; exit}')"

# ------------------------------------------------------------
# Connected state
# ------------------------------------------------------------
if [[ "$connection_state" == "Connected" ]]; then
  country="$(printf '%s\n' "$status_output" | awk -F': ' '/^Country:/{print $2; exit}')"
  city="$(printf '%s\n' "$status_output" | awk -F': ' '/^City:/{print $2; exit}')"
  ip="$(printf '%s\n' "$status_output" | awk -F': ' '/^IP:/{print $2; exit}')"
  protocol="$(printf '%s\n' "$status_output" | awk -F': ' '/^Current protocol:/{print $2; exit}')"

  text="${PREFIX} ${country}-${city} up"
  tooltip="
  NordVPN: Connected
  Connection: ${country}, ${city}
  IP: ${ip}
  Protocol: ${protocol}"

  printf '{"text":%s,"class":"connected","tooltip":%s}\n' \
    "$(json_escape "$text")" "$(json_escape "$tooltip")"
  exit 0
fi

# ------------------------------------------------------------
# Disconnected state
# ------------------------------------------------------------
if [[ "$connection_state" == "Disconnected" ]]; then
  text="${PREFIX} down"
  tooltip="NordVPN: Disconnected\nRight click: connect\nMiddle click: disconnect"

  printf '{"text":%s,"class":"disconnected","tooltip":%s}\n' \
    "$(json_escape "$text")" "$(json_escape "$tooltip")"
  exit 0
fi

# ------------------------------------------------------------
# Unknown or unexpected state fallback
# ------------------------------------------------------------
text="${PREFIX} ${ERROR_MARK}"
tooltip="NordVPN status unavailable:\n${status_output}"

printf '{"text":%s,"class":"error","tooltip":%s}\n' \
  "$(json_escape "$text")" "$(json_escape "$tooltip")"
