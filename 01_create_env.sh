#!/bin/bash

# This script use to creating a environment for Python.
# Run on Window
# How to run: ./01_create_env.sh 
#               Enter: name

echo "Author: QuocTuan"                                     
echo "Github: https://github.com/quoctuan-coder"                            

echo "Phease enter project name"
read -r name
if [ ! -d $name ]
then
    mkdir -p $name
fi
virtualenv -p "C:\Users\tuan.tran-quoc\AppData\Local\Programs\Python\Python39\python.exe" "$name/env"

# Get requirement library
# pip freeze > requirements.txt
# Install follow requirements
# pip install -r requirements.txt