#!/bin/bash

#######################################################
# Disk Space Monitoring
# this script will the monitor the Disk Space
# Author: Suresh
# Designation: Devops Engineer
######################################################
R='\033[0;31m'
G='\033[0;32m'

threshold=80

df -h | awk 'NR>1 {print $5,$6}' | while read usage partition
do 
usage=${usage%\%}

if [ $usage -ge $threshold ]; then
   echo "$R the partiton of disk is: $partition and usage is: $usage full"
   
else
   echo "$G the partiton of disk is: $partition and usage is: $usage normal"
fi
done

echo "========================================================="
echo " The usage monitor disk is completed"
echo "========================================================="
