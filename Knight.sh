#!/bin/bash
@echo off
clear
printf '\033[8;40;100t'
clear
IRed="\033[0;91m"   
White="\033[0;97m" 
UPurple="\033[4;35m"
BIPurple="\033[0;95m"
Color_Off="\033[0m"
BICyan="\033[1;96m" 

function main(){
	echo -e "${BIPurple}"
	echo                              
	echo                           
	echo "                 ██╗  ██╗███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗    ██╗  ██╗██╗     "
	echo "                 ██║ ██╔╝████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝    ╚██╗██╔╝██║     "
	echo "                 █████╔╝ ██╔██╗ ██║██║██║  ███╗███████║   ██║        ╚███╔╝ ██║     "
	echo "                 ██╔═██╗ ██║╚██╗██║██║██║   ██║██╔══██║   ██║        ██╔██╗ ██║     "
	echo "                 ██║  ██╗██║ ╚████║██║╚██████╔╝██║  ██║   ██║       ██╔╝ ██╗███████╗"
	echo "                 ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═╝╚══════╝"
	echo -e "${BIPurple}"  
	echo "                            [1]: Public IP          [2]: Private IP"
	echo "                            [3]: ARP Tables         [4]: Sus Connections"
	echo "                            [5]: Webpage Info       [6]: Port Connect"
	echo "                            [7]: CLEAR SCREEN       [8]: QUIT"
	echo -e "${White}"
	echo "                  /\                                                           /\ "
	echo "    _             )( __________________________   ____________________________ )(             _ "
	echo "   (_)|||||||||||(**)__________________________) (____________________________(**)|||||||||||(_) "
	echo "                  )(                                                           )( "
	echo "                  \/                                                           \/ "
	echo
	echo
	echo
	echo -e "${BIPurple}"

}
main


function input(){
	echo
	read -p $'\e[95mKnightXL>\e[0m ' choice
	#read -p "KnightXL> " choice 
}
function getpublicip(){
	curl ifconfig.me
}
function getprivateip(){
	ifconfig | grep 'inet '| grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1
}
function printarptable(){
	arp -a
}
function revealsusconnection(){
	echo "If nothing gets printed you have no suspicuous connections :)"
	echo -e "${IRed}"
	lsof -n -i -P | grep TCP | grep -v :443
	echo -e "${BIPurple}"
}
function printwebpageinfo(){
	echo "Enter domain name"
	read -p "> " domain
	whois $domain
}
function portconnect(){
	echo "Enter IP Address"
	read -p "> " ip
	echo "Enter port"
	read -p "> " port
	now=$(date)
	echo -e "${BICyan}"
	echo "CONNECTED: $now"
	echo -e "${BIPurple}"
	nc $ip $port
}



echo -e "${BIPurple}"
choice=1
while [ $choice != 8 ]; do
	input
	if [ $choice == 7 ]
	then
		clear
		main
	elif [ $choice == 1 ]
	then
		getpublicip
		echo
	elif [ $choice == 2 ]
	then
		getprivateip
	elif [ $choice == 3 ]
	then
		printarptable
	elif [ $choice == 4 ]
	then
		revealsusconnection
	elif [ $choice == 5 ]
	then 
		printwebpageinfo
	elif [ $choice == 6 ]
	then 
		portconnect
	else
		echo -e "${IRed}""INVALID ARGUMENT""${BIPurple}"
	fi
done


echo -e "${Color_Off}"
clear






