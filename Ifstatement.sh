#!/bin/sh

n=10
if [ $n -lt 10 ]
then
	echo "It is a on digit number"
else
	echo "It is a two digit number"
fi

# using if statement with AND logic
echo "Enter username"
read username
echo "Enter password"
read password

if [[ ($username == "admin" && $password == "Pass1234") ]]
then
	echo "valid user"
else
	echo "invalid user"
fi

# using if statement with OR logic
a=4
b=5
if [[ ($a -eq 4 || $b -eq 9)]]
then
	echo "OK"
else 
	echo "Not good"
	
fi
