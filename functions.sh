#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
echo "script started executing at : $TIMESTAMP"
VALIDATE(){
   if [ $1 -ne 0 ]
   then
      echo -e "$2 .....$R failure $N"
      exit 1
    else
    echo -e "$2 .....$G sucess $N"
    fi 
}

if [ $USERID -ne 0 ]
then
   echo "pleae run the script with super user"
   exit 1 # manually we off the script process if we initiate exit 1
else
   echo "you are a super user"
fi
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "installaing my sql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "installing git"

dnf install nginxx -y &>>$LOGFILE
VALIDATE $? "installing nginx"
