#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPT_NAME=$($0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
VALIDATE(){
   if [ $1 -ne 0 ]
   then
      echo "$2 .....failure"
      exit 1
    else
    echo "$2 .....sucess"
    fi 
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

dnf install git -y
VALIDATE $? "installing git"

dnf install nginx -y
VALIDATE $? "installing nginx"
