#!/bin/bash

#######################################################
# CPU Monitoring Report
# 30-CPU_Monitoring.sh
# Author : Suresh 
# Designation : Devops Engineer
#######################################################

threshold=80
R='\033[0;31m'
G='\033[0;32m'

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')

CPU=$(printf "%.0f" "$CPU")

echo  "$CPU"

if [ $CPU -ge $ threshold ]; then 
   echo -e "$R the cpu utilizations is full : $CPU"
else
   echo -e "$G the cpu utilization is normal : $CPU"
fi 

echo " the cpu utilization report successfully completed"




