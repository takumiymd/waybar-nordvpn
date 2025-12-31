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
VPN: Japan-Tokyo up <br />
<img width="324" height="66" alt="image" src="https://github.com/user-attachments/assets/1e5a3597-6f3a-4ba2-a3da-2589f7e5bf84" />

When disconnected:
VPN: down <br />
<img width="174" height="66" alt="screenshot-2025-12-30_16-30-55" src="https://github.com/user-attachments/assets/e346bba5-5bb7-44d1-b27f-1ed256842690" />


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




## License
MIT

