#!/bin/bash

echo "Select mode to setup"

items=(1 "Update"
       2 "Upgrade")

while choice=$(dialog --title "$TITILE" --menu "Please select" 10 40 3 "${items[@]}" 2>&1 > /dev/tty)
do 
case $choice in
    1) ;; sudo apt upgrade
    2) ;; sudo apt update
esac
done 
clear :