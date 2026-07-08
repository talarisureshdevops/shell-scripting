#!/bin/bash
threshold=80

df -h | aws 'NR>1 {print $5,$6}' | while read output
do
usage=$(echo $output | aws '{print $1}' | cut -d'%' -f1)
partition=$(echo $output | awk '{print $2}')

if [ $usage -ge threshold ]; then
   echo "warning $partition is ${usage} % full"
fi
done

