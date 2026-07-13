#!/bin/bash
SERVICES="sshd crond docker"
LOGFILE="/tmp/service_monitoring.log"
echo "==========================================================="
echo "service monitoring started :$(date)"
echo "==========================================================="

for service in $SERVICES
do
  echo "checking the services: $service"
  systemctl is-active --quiet $service
if [ $? -eq 0 ]; then 
   echo "$service is running"
   echo "$(date): $service running successfully" >>$LOGFILE
else
   echo "$serice is stopped"
   echo " restarting the $service......................."
   systemctl restart $serice
if [ $? -eq 0 ]; then 
   echo "$service restart successfully"
   echo "$(date): $serice is restarted successfully">>$LOGFILE
else 
   echo "$serice restarted failed"
   echo "$(date) : $service restarted failed" >>$LOGFILE
   fi 
fi 
   echo "=========================================================="
done 
   echo "Monitoring Completed"
   

