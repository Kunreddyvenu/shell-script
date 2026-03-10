#!bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "please run the script with root user"
   exit 1 # manually exit if issue occurs
else
   echo "you are a super user"
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
   echo "installation of my sql failure"
   exit 1
else
   echo "installation of my sql success"
fi

dnf install git -y

if [ $? -ne 0 ]
then
   echo "installation of git failure"
   exit 1
else
   echo "installation of git success"
   exit 1
fi
 echo "is script proceeding?"



