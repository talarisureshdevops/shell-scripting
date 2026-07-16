#!/bin/bash

#######################################################
# Disk Space Monitoring
# this script will the monitor the Disk Space
# Author: Suresh
# Designation: Devops Engineer
######################################################

threshold=80

df -h | awk 'NR>1 {print $5,$6}' | while read usage partition
do 
usage=$(usage%/%)

if [ $usage -gt $threshold ]; then
   echo "the partiton of disk is: $partition and usage is: $usage full"
   exit 1
else
   echo "the partiton of disk is: $partition and usage is: $usage normal"
fi
done

echo "========================================================="
echo " The usage monitor disk is completed 
echo "========================================================="
