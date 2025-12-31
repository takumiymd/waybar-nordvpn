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
VPN: Japan-Tokyo up
<img width="324" height="66" alt="image" src="https://github.com/user-attachments/assets/1e5a3597-6f3a-4ba2-a3da-2589f7e5bf84" />

When disconnected:
VPN: down
<img width="174" height="66" alt="image" src="https://github.com/user-attachments/assets/657d5028-7195-4e4f-

When an error occurs (e.g. NordVPN CLI not found): 
VPN: !!

Hovering over the VPN section displays detailed connection information, such as server location and status.
<img width="660" height="318" alt="screenshot-2025-12-30_16-34-57" src="https://github.com/user-attachments/assets/6c67ba0c-664c-4ae7-8b74-5fe2f864ab9a" />


## Controls
Mouse and touchpad interactions supported by the Waybar module:

- **Right click / two-finger click (touchpad)** → Connect to NordVPN
- **Middle click (mouse wheel)** → Disconnect from NordVPN

> Note: On some touchpads, three-finger click (middle click) may be disabled by default.




## License
MIT

