#!/bin/sh

# Copy all ignore file or dir store pattern 
cp -rf `ls | egrep -v 'PATTERN' dst/

# Copy all filer or dir store pattern
cp -rf `ls | egrep 'PATTERN' dst/

# Only  copy all files
cp -rf `ls | egrep -v '^d' dst/
