#!/bin/bash
threshold=30
RED='\033[0;31m'
NC='\033[0m'   # No Color (Reset)

df -h | awk 'NR>1 {print $5,$6}' | while read output
do
usage=$(echo "$output" | awk '{print $1}' | cut -d'%' -f1)
partition=$(echo "$output" | awk '{print $2}')

if [ "$usage" -ge "$threshold" ]; then
   echo -e "${RED}WARNING: $partition is ${usage}% full${NC}"
fi
done

