#!/bin/bash

echo "please enter the age here::"
read age

if [ $age -gt 18 ]; then 
   echo "Eligible to vote"
else
   echo "Not Eligible t vote"
fi  

