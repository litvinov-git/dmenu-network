# dmenu-network
Fast, robust and feature rich WiFi configuration script for dmenu-compatible launchers like wofi/rofi/tofi/fuzzel.
### Why not other scripts?
Some of them are on Python (ewww...), some of them simply dont work, some of them behave weirdly or have interface logic that just doesnt work for me. Also, I enjoy the process of bash scripting)
### Installation
Just copy paste the script wherever you want and bind it to some key combo in your WM.
## Demo
Pictures:
![](https://github.com/litvinov-git/dmenu-network/blob/main/20260101-212739.png?raw=true)
![](https://github.com/litvinov-git/dmenu-network/blob/main/20260101-212812.png?raw=true)
![](https://github.com/litvinov-git/dmenu-network/blob/main/20260101-212853.png?raw=true)
Videos:
![Connect, disconnect, forget](https://github.com/litvinov-git/dmenu-network/raw/refs/heads/main/WIFi1_compressed.mp4) | 
![Error handling](https://github.com/litvinov-git/dmenu-network/raw/refs/heads/main/WIFi2_compressed.mp4)

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

## Coming soon
Around January 10-11 2026 I have a plane back to my uni, which is when I will implement new features:
1. FULL configuration - all the functional of networkmanager you might need to configure eduroam, for example.
2. Repo with my other dmenu scripts.

## What is next?
What I want to have in the end of my dmenu script journey is an extensive collection of script nested into a single settings menu, that would allow to tweak any hyprland or similar WM based ssytem in a matter of seconds. I dont use any shell, bar or widgets, so scripts are the main way for me to interact with my system.
