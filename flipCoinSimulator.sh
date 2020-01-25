#!/bin/bash -x

read -p "How many times you want to flip coin? " flipCount

declare -A coin

counter=1;
coinCheck=1;
heads=0;
tails=0;

while [ $counter -le $flipCount ]
do
	coinFlip=$((RANDOM%2));
   if [ $coinCheck -eq $coinFlip ]
   then
      coin[H]=$((++heads))
      echo "Heads!!"
   else
      coin[T]=$((++tails))
      echo "Tails!!"
   fi
   ((counter++))
done

echo "Head Percentage = `echo "scale=2; ${coin[H]}*100/$flipCount" | bc` %"
echo "Tail Percentage = `echo "scale=2; ${coin[T]}*100/$flipCount" | bc` %"


echo "FlipCoin " ${coin[@]}
