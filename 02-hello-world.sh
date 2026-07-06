#!/bin/bash
echo "========================bash print practice================================"

echo "hello world"

echo 

echo "Linux"
echo "Devops"
echo "shell scripting"

echo -e "redhat\nubuntu\nrocky linux"

echo -e "Name\tRole\tExperience"
echo -e "Suresh\tDevops\t 5 years"

Name="suresh"
role="Devops Engineer"
echo "Name: $Name"
echo "role : $role"

echo "10 + 20 = $((10+20))"

echo "Date  : $(date)"
echo "User  : $(whoami)"
echo "Hostname : $(hostname)"
echo "Directory : $(pwd)"

#### Special Variables ####
echo "All args passed to script: $@"
echo "Number of vars passed to script: $#"
echo "Script name: $0"
echo "Present directory: $PWD"
echo "Who is running: $USER"
echo "Home directory of current user: $HOME"
echo "PID of this script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"





