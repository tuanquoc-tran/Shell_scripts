#!/bin/sh

# This script use to checking file is exists.

echo "Author: TuanTran"                                     
echo "Github: https://github.com/quoctuan-iot"   

# if dir don't exist, create dir
if [ ! -d source ]
then 
	mkdir -p source 
else
	echo "Dir source exist"
fi

# if file don't exist, create file
if [ ! -f main.c ]
then
	touch main.c
else 
	echo "File main exist"
fi


