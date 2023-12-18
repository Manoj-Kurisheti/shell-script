#!/bin/bash

ID=$(id -u)

Timestamp=$(date +%F-%H-%M-%S)
logfile="/tmp/$0-$Timestamp.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "script started executing at $Timestamp" &>>$logfile

VALIDATE() {
    if [ $1 -ne 0 ]
    then
    echo -e "$2....$R failed $N"
    exit 1
    else
    echo -e "$2.....$G success $N"
    fi
}

if [ $ID -ne 0 ]
then
echo -e "$R Error::please run this script with root access$N"
exit 1
else
echo "you are root user"
fi

for package in $@
do
yum list installed $package
if [ $? -ne 0 ]
then
yum install $package -y &>>$logfile
VALIDATE $? "Installing of $package"
else
echo -e "package is already installed ....$Y skipping $N"
fi 
done
