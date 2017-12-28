#!/bin/bash



# A menu driven shell script to run git commands
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined functions
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

menu1one(){
	cd /media/jason/Backup2/Media/gits/mywiki-git
	echo "Push git commits to mywiki folder on webserver"
	git push live
        pause
}
 
# do something in two()
menu1two(){
	echo "Turn on WiFi Radio"
	nmcli radio wifi on
        pause
}

# do something in two()
menu1three(){
	echo "Turn off WiFi Radio"
	nmcli radio wifi off
        pause
}

# do something in two()
menu1four(){
	clear
	echo "List all availible wifi networks"
	nmcli -p dev wifi
        pause
}

# do something in two()
menu1five(){
	echo "Connect to ProckNet6700 2"
	nmcli c up 4be93b80-c1ab-4e7a-9bf2-9e23bef6ec5e
        pause
}

# do something in two()
menu1six(){
	echo "Connect to *.*Procknow"
	#nmcli c up *.*Procknow
	nmcli c up ba5609c5-934c-4cfe-88f3-1231f8bf7d81
        pause
}

# do menu 1 option 7
menu1seven(){
	echo "Display all connection profiles"
	nmcli -p c
        pause
}

# do menu 1 option 8
menu1eight(){
	echo "Run nmcli connection script"
	./nmcliConnect.sh
        pause
}

# do menu 1 option 9
menu1nine(){
	echo "Show routing table"
	route
        pause
}
 
# function to display menus
show_menu1() {
	clear
	nmcli -p d status
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "            nmclimenu.sh"
	echo "          M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Push git commits to mywiki folder on webserver"
	echo "2. Turn on WiFi radio"
	echo "3. Turn off WiFi Radio"
	echo "4. List all availible wifi networks"
	echo "5. Connect to ProckNet6700 2"
	echo "6. Connect to *.*Procknow"
	echo "7. Display all connection profiles"
	echo "8. Run nmcli connection script - nmcliConnect.sh"
	echo "9. Show routing table"
	echo "0. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 6] " choice
	case $choice in
		1) menu1one ;;
		2) menu1two ;;
		3) menu1three ;;
		4) menu1four ;;
		5) menu1five ;;
		6) menu1six ;;
		7) menu1seven ;;
		8) menu1eight ;;
		9) menu1nine ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menu1
	read_options
done
 
