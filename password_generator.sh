#!/bin/bash

#Simple Password Generator

echo ""
echo "===THIS IS A SIMPLE PASSWORD GENERATOR==="
echo ""

read -p "Please enter the lenght of the password (min 6/max 36): " PASS_LENGHT

if [ -z $PASS_LENGHT ] || [ $PASS_LENGHT -gt 36 ] || [ $PASS_LENGHT -lt 6 ]; then
	echo "Please enter range from 6 to 36"
	exit
fi

echo ""
read -p "Please enter the number of passwords, which you want to generate: " PASS_COUNT
echo ""
echo "creating $PASS_COUNT password/s with lenght of $PASS_LENGHT"
echo ""
echo "========Here are your passwords========"

for i in $( seq 1 $PASS_COUNT );do
	openssl rand -base64 $PASS_LENGHT
done

