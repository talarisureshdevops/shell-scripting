#!/bin/bash 
for i in Monday Tuesday Wednesday Thursday Friday Saturday Sunday
do 
if [ $i = "Tuesday" ]; then
   echo "Today is :$i"
else
   echo "Not eligible"
fi 
done 
