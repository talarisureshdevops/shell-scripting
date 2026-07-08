#!/bin/bash
# disk usage monitoring report
threshold=80
LOGFILE="/tmp/disk_monitoring.log"
echo
echo "==============================================="
echo "Disk Usage Monitoring Report"
echo "Date : $(date)"
df -h | awk 'NR>1 {print $5,$6}' | while read usage partition
do

usage=${usage%\%}
if [ "$usage" -ge "$threshold" ]; then 
   echo "[Warning] $parition is ${usage}% full"
   echo "$(date): warning $partition is ${usage}% full" >>$LOGFILE
# else
#    echo "[OK] $partition is ${usage}% used"
fi
echo
#echo "log_file : $LOGFILE"
# echo "Log File : $LOGFILE"
done
