#!/bin/bash

ID=$(id -u)

VALIDATE(){

    if [ $1 -ne 0 ]
    then
    echo "$2....failed"
    exit 1
    else
    echo "$2....success"
    fi
}

if [ $ID -ne 0 ]
then
echo "error:please run with root access"
exit1
else
echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "installing mysql"

yum install git -y

VALIDATE $? "installing git"