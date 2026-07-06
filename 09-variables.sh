#!/bin/bash

echo "Please enter the value here::"
read num
if [ $((num % 2)) -eg 0 ]; then
   echo "Even"
else
   echo "odd"
fi 
