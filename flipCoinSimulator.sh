#!/bin/bash -x

coinCheck=1;

coinFlip=$((RANDOM%2));

if [ $coinCheck -eq $coinFlip ]
then
	echo "Heads!!"
else
	echo "Tails!!"
fi
