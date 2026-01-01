#!/bin/bash

# CONFIGURATION
menu() {
	fuzzel --dmenu --placeholder="$1"
}

menu_pin() {
	fuzzel --dmenu --password='*' --placeholder="Password"
}

# FUNCTIONS

#Connect to a network
connect() {
	local ssid=$1
	local rc
	if nmcli -t -f NAME connection show | grep -Fxq "$ssid"; then
		notify-send "Connecting..." -t 1800
		nmcli connection up "$ssid"
		rc=$?
		#notify-send "$rc"
	else
		local security=$(nmcli -t -f SSID,SECURITY dev wifi list | awk -F: -v s="$ssid" '$1==s {print $2; exit}')

		if [[ -z "$security" ]]; then
			notify-send "Connecting..." -t 1800
			nmcli device wifi connect "$ssid"
			rc=$?
			#notify-send "$rc"
		else
			local password=$(printf "Cancel" | menu_pin)
			if [[ "$password" == "Cancel"  || -z "$password" ]]; then
				rc=1
			else
				notify-send "Connecting..." -t 1800
				nmcli --wait 5 device wifi connect "$ssid" password "$password"
				rc=$?
			fi
		fi
	fi
	
	if (( $rc == 0 )); then
		notify-send "Connected:D" -t 1800
		exit 0
	elif (( $rc ==1 )); then
		handle_selected $ssid
	else
		notify-send "Failed(" -t 1800
		handle_failed $ssid
	fi
}


#If the chosen network is the active one
handle_active() {
	local ssid=$1
	local selection=$(printf "Edit\nDisconnect\nForget" | menu "$ssid")
	case $selection in
		Edit) notify-send "TODO" -t 1800;;
		Disconnect) nmcli connection down "$ssid";;
		Forget) nmcli connection delete "$ssid";;
	esac
}

#If the chosen network is profiled (memorized) but not active
handle_profiled() {
	local ssid=$1
	local selection=$(printf "Connect\nEdit\nForget" | menu "$ssid")
	case $selection in
		Connect) connect "$ssid";;
		Edit) notify-send "TODO" -t 1800;;
		Forget) nmcli connection delete "$ssid";;
	esac
}

#Failed connection menu
handle_failed() {
	local ssid=$1
	selection=$(printf "Retry\nForget\nExit" | menu "$ssid")
	case $selection in
		Retry)
			connect "$ssid"
		;;
		Forget)
			nmcli connection delete "$ssid"
			handle_failed "$ssid"
		;;
		Exit) exit 0;;
	esac	
}


#If the chosen tenwork is not profiled
handle_selected() {
	local ssid=$1
	local selection=$(printf "Connect\nEdit" | menu "$ssid")
	
	case $selection in
		Connect) connect "$ssid";;
		Edit) notify-send "TODO" -t 1800;;
	esac
}

# MAIN

#Get list and current from cash
active=$(nmcli -t -f ACTIVE,SSID dev wifi list --rescan no | grep '^yes' | cut -d: -f2)
list=$(nmcli -t -f SSID dev wifi list --rescan no | sed '/^$/d' | sort -u)

#Rescan available networks in the background
nmcli device wifi rescan & disown

#Add rescan option to the menu input
list="--Rescan"$'\n'"$list"

#Check if connected
if [ -z "$active" ]; then
	prompt="Not connected"
	connected=false
else
	prompt="Connected:"
	connected=true
	list=$(echo "$list" | grep -v "$active")
	list="> $active <"$'\n'"$list"
fi


#Launch menu, get choice
choice=$(echo "$list" | menu "$prompt")


#Hadnle choice
if [ "$choice" = "> $active <" ]; then
	handle_active "$active"
elif [[ -z "$choice" ]]; then
	exit 0
elif [ "$choice" = "--Rescan" ]; then
	nmcli device wifi rescan
	exec "$0"
elif nmcli -t -f NAME connection show | grep -Fxq "$choice"; then
	handle_profiled "$choice"
else
	handle_selected "$choice"
fi

	
			

#TODO
#Signal indicators and icons
#Editing configurations
		
	
