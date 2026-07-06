#!/bin/bash

echo "Please enter the number here::"
read num
if [ $num -gt 0 ]; then 
   echo "the number is positive"
elif [ $num -lt 0 ]; then 
   echo "the number is negative"
else
   echo "the number is zero"
fi
