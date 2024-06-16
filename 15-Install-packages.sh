#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$( echo $0 | cut -d "." -f1 )
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p /tmp

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root access"
   exit 1 #Manully exit if error comes
else
   echo "You are super user"
fi

for i in "$@"
do
  echo "Package need to install: $i"
  dnf list installed $i &>>$LOGFILE
  if [ $? -eq 0 ]
  then
      echo -e "$i ${G}already installed${N}"
   else
      echo -e "$i need to be ${R}installed${N}"
      dnf install -y $i &>>$LOGFILE
      if [ $? -eq 0 ]
      then
         echo -e "$i is ${Y}SUCCESSFULLY INSTALLED${N}"
      else
         echo -e "$i is ${R}FAILED to INSTALL${N}"
      fi
   fi
done