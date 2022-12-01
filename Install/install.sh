#!/bin/bash
@echo off
Red="\033[0;91m" 
Color_Off="\033[0m"
BIGreen="\033[1;92m" 

if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "cygwin" ]]; then 
	clear
	echo -e "${Red}"
	echo "THIS IS INSTALLING EVERYTHING YOU NEED FOR KNIGHT XL (5 minutes)"
	echo -e "${Color_Off}"
	#install arp
	sudo apt-get update
	sudo apt-get install net-tools
	#install lsof
	sudo apt-get install lsof
	#install whois
	sudo apt install whois
	clear
	echo -e "${BIGreen}"
	echo "YOU HAVE FINISHED DOWNLOADING THE NEEDED FILES, GO INTO THE SCRIPTS FOLDER TO RUN KNIGHT XL"
	echo -e "${Color_Off}"

else
	clear
	echo -e "${Red}"
	echo "THIS IS INSTALLING EVERYTHING YOU NEED FOR KNIGHT XL (5 minutes)"
	echo -e "${Color_Off}"
	#install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	#install arp
	brew install arp-scan
	#install lsof
	brew install lsof
	#install whois
	brew install whois
	clear
	echo -e "${BIGreen}"
	echo "YOU HAVE FINISHED DOWNLOADING THE NEEDED FILES, GO INTO THE SCRIPTS FOLDER TO RUN KNIGHT XL"
	echo -e "${Color_Off}"
fi