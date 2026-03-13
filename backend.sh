#!bin/bash
USERID=(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME/$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
echo "please enter DB password:"
read -s mysql__root_password

VALIDATE(){
    if [ $1 -ne 0]
    then
       echo -e "$2 ....$R FAILURE $N"
       exit 1
     else
     echo -e "$2 ....$G SUCCESS $N"  
     fi
}

if [ $USERID -ne 0 ]
then
echo "please run this script with root access."
exit 1
else
echo "you are super user"
fi

dnf module disbale nodejs -y &>>$LOGFILE
VALIDATE $? "disbling default nodejs"

dnf module enable nodejs:20 -y &>>$LOGFILE
VALIDATE $? "enabling nodejs:20 version"

dnf install nodejs:20 -y &>>$LOGFILE
VALIDATE $? "installing nodejs"

id expense &>>$LOGFILE
if [$? -ne 0]
then
   useradd expense &>>$LOGFILE
   VALIDATE $? "create expense user"
else 
   echo "expense user already exit" $Y skipping $N"
fi
mkdir -p /app &>>$LOGFILE
VALIDATE $? "Downloading backend code"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOGFILE
VALIDATE $? "downloading backend code"

cd /app
rm -rf /app/*  #Remving old data in that app folder
unzip /tmp//backend.zip &>>$LOGFILE
VALIDATE $? "extrated backend code"

npm install &>>$LOGFILE
VALIDATE $? "installing nodejs dependencies"

#check your repo and path
cp /home/ec2-user/exepnce-shell/backend.service /etc/systemd/system/backend.service &>>$LOGFILE
VALIDATE $? "copied backend service"

systemctl daemon-reload &>>$LOGFILE
VALIDATE $? "daemon reload"

systemctl start backend.service &>>$LOGFILE
VALIDATE $? "starting backend"

systemctl enable backend &>>$LOGFILE
VALIDATE $? "enablaing backend"

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "installing mysql"






