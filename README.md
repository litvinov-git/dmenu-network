# dmenu-network
Fast, robust and feature rich WiFi configuration script for dmenu-compatible launchers like wofi/rofi/tofi/fuzzel. Option "edit" automatically redirects to the selected network in nm-connection-editor, internal editing is planned as well. Proper pin entry and signal icons.
### Why not other scripts?
Some of them are on Python (ewww...), some of them simply dont work, some of them behave weirdly or have interface logic that just doesnt work for me. Also, I enjoy the process of bash scripting)
### Installation
Just copy paste the script wherever you want and bind it to some key combo in your WM.
## Demo
Pictures:
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213513.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213522.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213616.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213545.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260101-212853.png)

## Configuration
This script supports all dmenu-compatible launchers, you can easily configure your launcher and its password entry mode in the beggining:

```bash
# CONFIGURATION
menu() {
	fuzzel --dmenu --placeholder="$1"
}

menu_pin() {
	fuzzel --dmenu --password='*' --placeholder="Password"
}
```

I personally use fuzzel in dmenu mode, which is what you can see on demo.

## What is next?
What I want to have in the end of my dmenu scripting journey is an extensive collection of scripts nested into a single settings menu, that would allow to tweak any hyprland or a similar WM based ssytem in a matter of seconds. I dont use any shell, bar or widgets, so scripts are the main way for me to interact with my system.
