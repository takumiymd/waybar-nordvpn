# Waybar NordVPN Module

A lightweight Waybar custom module that displays the current NordVPN connection status and allows quick connect/disconnect via mouse or touchpad interactions.

## Features
- Shows VPN connection state directly in Waybar
- Displays connected country and city
- Simple mouse and touchpad controls
- No special fonts or icons required


## Requirements
- Waybar
- NordVPN CLI (`nordvpn`)
- Bash or POSIX-compatible shell
- python3


## Output
When connected: 
VPN: Japan-Tokyo up <br />
<img width="324" height="66" alt="image" src="https://github.com/user-attachments/assets/1e5a3597-6f3a-4ba2-a3da-2589f7e5bf84" />

When disconnected:
VPN: down <br />
<img width="174" height="66" alt="screenshot-2025-12-30_16-30-55" src="https://github.com/user-attachments/assets/8b869937-3605-4106-bf51-4affd0646bee" />



When an error occurs (e.g. NordVPN CLI not found): 
VPN: !! <br />
<img width="118" height="64" alt="image" src="https://github.com/user-attachments/assets/75ad6551-f2e9-40f6-9a30-c415b9856bab" />

Hovering over the VPN section displays detailed connection information, such as server location and status.
<img width="660" height="318" alt="screenshot-2025-12-30_16-34-57" src="https://github.com/user-attachments/assets/6c67ba0c-664c-4ae7-8b74-5fe2f864ab9a" />


## Controls
Mouse and touchpad interactions supported by the Waybar module:

- **Right click / two-finger click (touchpad)** → Connect to NordVPN
- **Middle click (mouse wheel)** → Disconnect from NordVPN

> Note: On some touchpads, three-finger click (middle click) may be disabled by default.


## Directory Structure
<<<<<<< HEAD
~/.config/waybar/
├── config.jsonc
├── style.css
└── scripts/
=======
```text
~/.config/waybar/ 
├── config.jsonc 
├── style.css 
└── scripts/ 
>>>>>>> 8010821 (Update README.md)
    └── nordvpn-status.sh
```


## Setup
1. Copy `nordvpn-status.sh` into:
<<<<<<< HEAD
   ~/.config/waybar/scripts/

2. Make the script executable:
=======
   ```text
   ~/.config/waybar/scripts/
   ```
   
3. Make the script executable:
   ```bash
>>>>>>> 8010821 (Update README.md)
   chmod +x ~/.config/waybar/scripts/nordvpn-status.sh
   ```

<<<<<<< HEAD
3. Add the following to your Waybar `config.jsonc`:
"custom/vpn": {
  "exec": "~/.config/waybar/scripts/nordvpn-status.sh",
  "interval": 5,
  "return-type": "json",
  "format": "{}",
  "on-click": "nordvpn status",
  "on-click-right": "nordvpn connect",
  "on-click-middle": "nordvpn disconnect"
=======
5. Add the following to your Waybar `config.jsonc`:
```jsonc
"custom/vpn": { 
  "exec": "~/.config/waybar/scripts/nordvpn-status.sh", 
  "interval": 5, 
  "return-type": "json", 
  "format": "{}", 
  "on-click": "nordvpn status", 
  "on-click-right": "nordvpn connect", 
  "on-click-middle": "nordvpn disconnect" 
>>>>>>> 8010821 (Update README.md)
}
```


## License
MIT

