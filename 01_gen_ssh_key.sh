#!/bin/sh

# This script use to creating a ssh key for git.
# How to run: ./01_gen_ssh_key.sh 

echo "Author: TuanTran"                                     
echo "Github: https://github.com/quoctuan-iot"   

# Note: Need run manual, if asked enter passphrase when push
# Check for an existing ssh key 

ls -al ~/.ssh > ~/log
if [ ! -d `grep -q "known_hosts" ~/log && echo $?` ]
then
    rm -rfv ~/.ssh
    #echo "SSH key is generated"
else
    echo "Generate SSH key"
    mkdir $HOME/.ssh
    echo "Please enter email"
    read -r email
    # generate a new set of keys
    ssh-keygen -t rsa -b 4096 -C $email

    # Add your SSH key to ssh-agent
    eval `ssh-agent -s`
    ssh-agent -s

    # Default is id_rsa 
    ssh-add ~/.ssh/id_rsa

    # copy the output
    clip < ~/.ssh/id_rsa.pub

    # Then paste to ssh key github

fi
rm -rf ~/log
echo "==================="
echo "Complete"
