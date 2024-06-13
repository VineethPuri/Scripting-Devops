#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$( echo $0 | cut -d "." -f1 )
LOGFILE=/temp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N='\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R failure $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo " please run this script with superuser "
    exit 1 #manully exit if error comes
else
    echo " you are superuser "
fi

dnf install mysql -y &>> $LOGFILE

VALIDATE $? " installing mysql "

dnf install git -y &>> $LOGFILE

VALIDATE $? " installing git "