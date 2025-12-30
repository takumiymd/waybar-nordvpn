# Waybar NordVPN Module

A lightweight Waybar custom module that displays the current NordVPN connection status and allows quick connect/disconnect via mouse or touchpad interactions.

## Features
- Shows VPN connection state directly in Waybar
- Displays connected country and city
- Simple mouse and touchpad controls
- No special fonts or icons required

## Requirements
- `nordvpn` CLI
- Waybar

## Output
When connected: 
VPN: <Country>-<City> up

When disconnected:
VPN: down

When an error occurs (e.g. NordVPN CLI not found): 
VPN: !

## Controls
Mouse and touchpad interactions supported by the Waybar module:

- **Right click / two-finger click (touchpad)** → Connect to NordVPN
- **Middle click (mouse wheel)** → Disconnect from NordVPN

> Note: On some touchpads, three-finger click (middle click) may be disabled by default.

## License
MIT

