#!/bin/sh

# Author: TuanTran
# Version: 1
# Date: 08-03-22

# Run: Ubuntu 20.04

clear
current_dir=`pwd`
user_name=`whoami`

#==============================================================================
usage(){
    echo "Usage: install_sw_u20.sh.sh"
    echo "-h, --help"
    echo "Only run install_sw_u20.sh "
}

#==============================================================================
if ! [ -z "$1" ]
then 
    if [ $1 = "--help" ] || [ $1 = "-h" ]
    then
        usage
    fi
    exit 1
fi

#==============================================================================
echo "Install soflware."
echo "[1] Update and upgrade system."
echo "[2] Install Vscode."
echo "[3] Enable sharing from window and ubuntu on virtualBox."

read -p "Mode: " option

if [ $option = 1 ] # Testing OK
then
    sudo apt update
    sudo apt upgrade

elif [ $option = 2 ] # Testing OK
then
    sudo apt install snap
    sudo snap install --classic code

elif [ $option = 3 ] # Testing OK
then
    sudo gpasswd -a $user_name vboxsf
fi 

#==============================================================================

