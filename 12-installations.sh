#!/bin/bash
USER_ID=$(id - u)
if [ $USER_ID - ne 0 ]; then
   echo "Please run this script with root user access"
   exit 1
fi
echo "installing nginx"
dnf install nginx -y
if [ $? - ne 0 ]; then
   echo "Installing nginx........FAILURE"
   exit 1
else
   echo "Installing nginx........SUCCESS"
fi
echo "installing mysql"
dnf install mysql -y
if [ $? -ne 0 ]; then
   echo "installing mysql........FAILURE"
   exit 1
else
   echo "Installing mysql........SUCCESS"
fi
   echo "installing nodejs"
   dnf install nodejs -y
if [ $? -ne 0 ]; then
   echo "installing nodejs.......FAILURE"
   exit 1
else
   echo "innstalling nodejs......SUCCESS"
fi



