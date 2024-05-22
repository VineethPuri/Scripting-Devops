#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "Exit status: $1"
    echo " wht are u doing: $2"
}

if [ $USERID -ne 0 ]
then
    echo " please run this script with superuser "
    exit 1 
else
    echo " you are superuser "
fi

dnf install mysql -y

VALIDATE $? " installing mysql "

dnf install git -y

VALIDATE $? " installing mysql "