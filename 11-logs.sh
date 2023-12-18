#!/bin/bash

ID=$(id -u)

Timestamp=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

logfile="/tmp/$0-$Timestamp.log"

echo "script started executing at $Timestamp &>>$logfile

VALIDATE() {
    if[ $1 -ne 0 ]
    then
    echo -e "Error:$2...$R Failed $N"
    exit1
    else
    echo -e "$2....$G success $N"
    fi
}

if [ $ID -ne 0 ]
then
echo -e "$R Error::please run this with root access $N"
exit 1
else
echo "you are root user"
fi

yum install mysql -y &>>$logfile
VALIDATE $? "Installing mysql"

yum install git -y &>>$logfile
VALIDATE $? "Installing git"