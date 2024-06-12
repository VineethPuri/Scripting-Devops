#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$( echo $0 | cut -d "." -f1 )
LOGFILE=/temp/$SCRIPTNAME-$TIMESTAMP.log

VALIDATE(){
    if [$1 -ne 0]
    then
        echo " $2...failure "
        exit 1
    else
        echo "$2....SUCCESS"
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