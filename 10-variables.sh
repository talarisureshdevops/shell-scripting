#!/bin/bash

echo "Plese enter file name here::"
read file
if [ -f $file ]; then 
   echo "file name exists"
else
   echo "file name not exits"
fi

