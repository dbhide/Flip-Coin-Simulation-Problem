#!/bin/bash -x

declare -A coin

read -p "How many times you want to flip coin? " flipCount
read -p "Enter choice : 1] Singlet 2] Doublet 3] Triplet" choice

case $choice in
   1)
      coinCount=1
      ;;
   2)
      coinCount=2
      ;;
	3)
		coinCount=3
		;;
esac


function CoinFlip()
{
	for((i=1; i<=$1; i++))
   do
   	side=""
      	for((j=1;j<=$2;j++))
         	do
            	if [ $((RANDOM%2)) -eq 1 ]
               then
               	side+=H
               else
                 	side+=T
               fi
            done
            Count $side
  done
}

function Count()
{
	coin[$1]=$((${coin[$1]}+1))
}

function Percentage()
{
	for i in ${!coin[@]}
   do
   	coin[$i]=`echo "scale=2; ${coin[$i]}*100/$flipCount" | bc`
   done
      echo "Key Value ${!coin[@]}"
      echo "Percent ${coin[@]}"
}

function  WinnerCombination()
{
	for i in ${!coin[@]}
	do
		echo "$i ${coin[$i]}"
	done | sort -k2 -rn | head -1
}

CoinFlip $flipCount $coinCount
Percentage
WinnerCombination
