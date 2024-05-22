#!/bin/bash

USERID=$(id -u)

VALIDATE(){


if [ $USERID -ne 0 ]
then
    echo " please run this script with superuser "
    exit 1 
else
    echo " you are superuser "
fi

}

dnf install mysql -y

VALIDATE $? " installing mysql "

dnf install git -y

VALIDATE $? " installing mysql "