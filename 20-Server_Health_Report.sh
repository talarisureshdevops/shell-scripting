#!/bin/bash

##########################################################

# Script Name: server_health_report.sh
# Purpose    : Generate Linux Server Health report
# Author     : Suresh 144708
######################################################

REPORT="tmp/server_health_serpot_$(date +%F_%H-%M-%S).log"

echo "========================================" > $REPORT
echo " LINUX SERVER HEALTH REPORT             " >> $REPORT
echo "========================================" >> $REPORT
echo " Hostname            : $(hostname)" >> $REPORT
echo " IP Address          : $(hostname -I | awk '{print $1}')" >> $REPORT
echo " Date                : $(date)" >> $REPORT
echo "========================================" >> $REPORT

########################################################
# CPU Usage
########################################################

CPU= $(top -dn1 | grep "Cpu(s)" | awk '{print 100-$8}')
echo "" >> $REPORT
echo "=================CPU USAGE====================" >>$REPORT
printf "%.0f\n" "$CPU"  >> $REPORT

##########################################################
# Memory Usage
##########################################################

echo "" >> $REPORT
echo "=================== MEMORY USAGE ===============" >> $REPORT

free -h >> $REPORT
############################################################
# Disk Usage
############################################################

echo "" >> $REPORT
echo "==================== DISK USAGE ==============" >>$REPORT

df -h >>$REPORT

###############################################################
# Load Average
###############################################################
echo "" >> $REPORT
echo "================= LOAD AVERAGE ==================">>$REPORT

uptime | awk -F 'load average:' '{print $2}' >> $REPORT
############################################################
# Uptime
############################################################
echo "" >> $REPORT
echo "================ SERVER UPTIME===================">> $REPORT
uptime -p >> $REPORT

############################################################
# Logged In Users
############################################################

echo "" >> $REPORT
echo "================= LOGGED-IN USERS =================" >> $REPORT
who >> $REPORT


############################################################
# Zombie Processes
############################################################

echo "" >> $REPORT
echo "========== ZOMBIE PROCESSES ==========" >> $REPORT

ZOMBIES=$(ps -eo stat | grep -c Z)

echo "Zombie Process Count : $ZOMBIES" >> $REPORT

############################################################
# Top 5 Memory Consuming Processes
############################################################

echo "" >> $REPORT
echo "========== TOP 5 MEMORY PROCESSES ==========" >> $REPORT

ps -eo pid,user,%mem,%cpu,comm --sort=-%mem | head -6 >> $REPORT

############################################################
# Top 5 CPU Consuming Processes
############################################################

echo "" >> $REPORT
echo "========== TOP 5 CPU PROCESSES ==========" >> $REPORT

ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -6 >> $REPORT

############################################################

echo "" >> $REPORT
echo "Report Generated Successfully." >> $REPORT

echo "Server Health Report Saved At:"
echo "$REPORT"







