USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "pleae run the script with super user"
   exit 1 # manually we off the script process if we initiate exit 1
else
   echo "you are a super user"
if
dnf install mysql -y

if [ $? -ne 0 ]
then
   echo "installation of mysql failure"
   exit 1
else
   echo "instllation of mysql sucess"
fi
dnf install Git -y
if [ $? -ne 0 ]
then 
    echo "instllation of git failure"
else
   echo "installation of git success"
fi
echo "is script still proceeding?"           
