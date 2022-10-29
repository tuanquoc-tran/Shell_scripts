#!/bin/sh

# Author: TuanTran
# Version: 1
# Date: 15-07-21

# Run: Ubuntu 20.04

usage(){
    echo "Usage: 02_script_common_v1.sh"
    echo "-h, --help"
    echo "Only run 02_script_common_v1.sh after choose mode to do"
}

# Replace a name for multiple files in folder
func_replace()
{
    path=$1
    p1=$2
    p2=$3
    for dir in `ls $path | grep $p1`
    do 
        tmp=`echo $dir | sed -e "s/$p1/$p2/g"`
        mv $path/$dir $path/$tmp 
    done
}

# Convert dos2unix
func_dos2unix(){
    file=$2
    path=$1
    find $path -type f -name $file* | dos2unix
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

echo "\033[34mScript common\033[0m"
echo "\033[34mChoose option:\033[0m"
echo "\033[34m[1] Replace a name for multiple files in directory.\033[0m"
echo "\033[34m[2] Convert dos2unix for all files in directory.\033[0m"

read -p "Mode: " option

if [ $option = 1 ]
then
    read -p"Directory: " directory
    ls $directory
    read -p "Find what: " find
    read -p "Replace with: " rep

    func_replace $directory $find $rep
    echo "\033[32m[INF] Replace successfully\033[0m"

elif [ $option = 2 ]
then
    read -p"Directory: " directory
    ls $directory
    read -p "File: " file
    func_dos2unix $directory $file
    
    echo "\033[32m[INF]Convert successfully033[0m"

fi 

#==============================================================================
