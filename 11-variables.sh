#!/bin/bash

echo "please enter the directory here::"
read dir
if [ -d "$dir" ]; then
   echo "the directory exists"
else
   echo "the directory not exists"
fi

