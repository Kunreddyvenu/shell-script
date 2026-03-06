#!/bin/bash
echo "all variables : $@"
echo "Number of variables passed: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "Home directly of current user: $HOME"
echo "wich user is running this script: $USER"
echo "Hostname: $HOSTNAME"
echo "process ID of the curret sell script: $$"
sleep 30 &
echo "process id of last background command: $!"
# thease all are special variables 
# asks in interviews