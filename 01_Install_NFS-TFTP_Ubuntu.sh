#!/bin/sh
# Run on linux
# Note:
# - Install tftp
# Author: QuocTuan
# Version: 0.1

clear
current_dir=`pwd`
user_name=`whoami`

sudo apt-get update
sudo apt-get upgrade

# ===== Setup tftp =====
# Check status of tftpd-hpa
service tftpd-hpa status > log_check_status
if [ ! `grep -q "active" log_check_status && echo $?` ]
then
	echo "[INFO] Tftpd-hpa is installing......................................."
	# Install tftpd-hpa
	sudo apt-get install tftpd-hpa
	# Disable firewall
	sudo ufw disable
fi

# ===== Setup NFS server =====
# Check status of nfs service
service nfs-kernel-server status > log_check_status
if [ ! `grep -q "active" log_check_status && echo $?` ]
then
	echo "[INFO] nfs service is installing....................................."
	# Install nfs-kernel-server
	sudo apt-get install nfs-kernel-server
	# Start a nfs-kernel-server
	sudo /etc/init.d/nfs-kernel-server start
fi

# Remove log check status
rm -rf log_check_status

# ===== Setup dir nfs server=====
if [ ! -d /nfs ]
then
	echo "[INFO] Create dir nfs............................................... "
	sudo mkdir -p /nfs/
	echo "/nfs/ *(rw,no_subtree_check,sync,no_root_squash)" |sudo tee -a /etc/exports
	# Force NFS server to read exports
	sudo exportfs -a
	# Confirm NFS server start​ successfully
	showmount -e localhost 
fi

# Set static ip for host machine
if [ ! `grep -q "address" /etc/network/interfaces && echo $?` ]
then
	echo "Uncommand 4 lines below"
	echo "Change address, netmask follow laptop"
	#echo "Set static ip for host machine"
	#echo "iface enp0s3 inet static"  |sudo tee -a /etc/network/interfaces
	#echo "address 192.168.4.2" |sudo tee -a /etc/network/interfaces
	#echo "netmask 255.255.255.0" |sudo tee -a /etc/network/interfaces
fi

echo "========================================================================="
echo "[INFO] Setup tftp server successfully"

