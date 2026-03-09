#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then

  echo " please run this script with root access"
  exit 1 # manually exit if error comes.
  else
  echo "you are super user"

  fi

dnf install mysql -y

if [ $USERID -ne 0 ]

then 
   echo "installation of my sql failure"
   exit 1

   fi

   dnf install git -y

echo "why did you not stop above"