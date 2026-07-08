#!/bin/bash

free -m

echo "used memory"

free -m | awk "NR==2 {print $3 "MB"}"

echo "free memory"

free -m | awk "NR==2 {print $4 "MB"}"

