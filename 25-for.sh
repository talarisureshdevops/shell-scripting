#!/bin/bash
for i in 5
do 
  for j in 1 2 3 4 5 6 7 8 9 10
  do 
    echo "$i "*" "$j"=$((i+j))"
  done
done 