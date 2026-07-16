#!/bin/bash

#######################################################
# CPU Monitoring Report
# Author : Suresh
# Purpose : Monitor CPU Usage and Send Email Alert
#######################################################

# Configuration
THRESHOLD=80
EMAIL="mailtosuresh.bi@gmail.com"

# Colors
R='\033[0;31m'
G='\033[0;32m'
NC='\033[0m'

# Server Details
HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $1}')
DATE=$(date)

# Get CPU Usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')
CPU=$(printf "%.0f" "$CPU")

echo "CPU Usage : ${CPU}%"

if [ "$CPU" -ge "$THRESHOLD" ]
then
    echo -e "${R}WARNING : CPU Usage is ${CPU}%${NC}"

cat <<EOF >/tmp/cpu_alert.html
<html>
<head>
<style>
body{
font-family:Arial;
background:#f5f5f5;
}
table{
border-collapse:collapse;
width:60%;
}
th{
background:red;
color:white;
padding:10px;
}
td{
padding:10px;
border:1px solid #ddd;
}
h2{
color:red;
}
</style>
</head>

<body>

<h2>⚠ CPU Alert Notification</h2>

<table>

<tr>
<th>Parameter</th>
<th>Value</th>
</tr>

<tr>
<td>Hostname</td>
<td>$HOSTNAME</td>
</tr>

<tr>
<td>IP Address</td>
<td>$IP</td>
</tr>

<tr>
<td>Date</td>
<td>$DATE</td>
</tr>

<tr>
<td>CPU Usage</td>
<td><b style="color:red;">${CPU}%</b></td>
</tr>

<tr>
<td>Status</td>
<td><b style="color:red;">CRITICAL</b></td>
</tr>

</table>

<br>

<p>
CPU utilization has crossed the configured threshold of <b>${THRESHOLD}%</b>.
Please investigate the server immediately.
</p>

</body>
</html>
EOF

s-nail \
-a "Content-Type: text/html" \
-s "CPU ALERT : $HOSTNAME" \
"$EMAIL" < /tmp/cpu_alert.html

else

echo -e "${G}CPU Utilization Normal : ${CPU}%${NC}"

fi

echo "CPU Monitoring Completed."