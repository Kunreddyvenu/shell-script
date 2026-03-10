#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    echo "exit status: $1"
    echo "what are you doing: $2"
}

if [ $USERID -ne 0 ]
then
   echo "pleae run the script with super user"
   exit 1 # manually we off the script process if we initiate exit 1
else
   echo "you are a super user"
fi
dnf install mysql -y
VALIDATE $? "installaing my sql"

dnf install Git -y
VALIDATE $? "installing git"
