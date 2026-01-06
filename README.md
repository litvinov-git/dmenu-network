[Installation](#installation) | [Demo](#demo) | [Configuration](#configuration) | [What is next?](#what-is-next)
# dmenu-network
Fast, robust and feature rich WiFi configuration script for dmenu-compatible launchers like wofi/rofi/tofi/fuzzel. Option "edit" automatically redirects to the selected network in nm-connection-editor, internal editing is planned as well. Proper pin entry and signal icons.
### Why not other scripts?
Some of them are on Python (ewww...), some of them simply dont work, some of them behave weirdly or have interface logic that just doesnt work for me. Also, I enjoy the process of bash scripting)
## Installation
1. Make sure that you have a dmenu-compatible menu (wofi/rofi/tofi/fuzzel, bemenu, dmenu itself, etc), and nm-connection-editor:

- Install a menu:
```
sudo pacman -S fuzzel #Arch
sudo apt get fuzzel #Ubuntu
```

- Install nm-connection-editor (it is likely present by default in GNOME and KDE):
	
```
sudo pacman -S nm-connection-editor
sudo apt get network-manager-gnome
```
3. Download the script, make it executable (by default these commands will put it in ~/.local/bin):
```
cd ~/.local/bin/
curl -o network.sh https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/network.sh
chmod +x ./network.sh
```
- If you want it to appear on your desktop/app launcher, install the desktop file as well:
```
cd ~/.local/share/applications
curl -o network-menu.desktop https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/network-menu.desktop
```
**Note**: for the application to appear on your desktop, you will likely need to log out and back in
4. Configure it to use your menu (see [Configuration](#configuration)), default is fuzzel
5. Make it accessible for yourself using:

- A hotkey bind in your DE/WM (KDE, GNOME, hyprland, sway, etc.), check the documentation on the option you use

- The desktop file

**Note**: if you did everything like in this guide, your executable (shell command to launch the script) is /home/your-user/.local/bin/network.sh
   
## Demo
Pictures:
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213513.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213522.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213616.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260106-213545.png)
![](https://raw.githubusercontent.com/litvinov-git/dmenu-network/refs/heads/main/20260101-212853.png)

## Configuration
This script supports all dmenu-compatible launchers, you can easily configure your launcher and its password entry mode in the beggining of the script:

```bash
# CONFIGURATION
menu() {
	fuzzel --dmenu --placeholder="$1" #place the command to call your menu here, using the first argument ($1) as a placeholder or prompt
}

menu_pin() {
	fuzzel --dmenu --password='*' --placeholder="Password" #command to call your menu in the pin entry mode, but if you dont care you can use it in the regular mode
}
```

I personally use fuzzel in dmenu mode, which is what you can see on demo.

## What is next?
What I want to have in the end of my dmenu scripting journey is an extensive collection of scripts nested into a single settings menu that would allow to tweak any hyprland or a similar WM based ssytem in a matter of seconds. I dont use any shell, bar or widgets, so scripts are the main way for me to interact with my system.
