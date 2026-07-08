#!/bin/bash
CPU_THRESHOLD=80
MEM_THRESHOLD=80

echo "============================================"
echo "Cpu & Memory Monitoring"
echo "============================================"
########################################
# CPU USAGE
########################################

CPU=$( top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')
CPU=$(printf "%.0f" "$CPU")
echo
echo "cpu usage is: ${cpu}%"
if [ "$CPU" -ge "$CPU_THRESHOLD" ]; then 
   echo "warning: cpu usage is high"
else
   echo "cpu usage is normal"
fi
########################################
# Memory Usage
########################################
TOTAL=$(free -m | awk 'NR==2 {print $2}')
USED=$(free -m | awk 'NR==2 {print $3}')
FREE=$(free -m | awk 'NR==2 {print $4}')
MEM_PERCENTAGE=$((USED*100/TOTAL))
echo
echo "Memory Reporting"
echo "total :${TOTAL} MB"
echo "used : ${USED}  MB"
echo "free : ${FREE}  MB"
echo "usage : ${MEM_PERCENTAGE} MB"

if [ "$MEM_PERCENTAGE" -ge "$MEM_THRESHOLD" ]; then 
   echo "warning : Memory usage is high"
else
   echo "Memory usage is normal"
fi






