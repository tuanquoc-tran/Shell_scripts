#!/bin/sh

# validate input is alphabets

func_validate()
{
	# returns 0 if all arguments upper+lower+digits, 1 otherwise
	if [ "$(echo $1 | sed -e 's/[^[:alnum:]]//g')" != "$input" ]
	then
		return 1
	else
		return 0
	fi
	
}

echo -n "Enter input"
read input

if  ! func_validate "$input"
then
	echo "Input is invalid"
	exit 1
else 
	echo "Input is valid"
	exit 0
fi 
