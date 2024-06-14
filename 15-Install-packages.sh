#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root access"
   exit 1 #Manully exit if error comes
else
   echo "You are super user"
fi

for i in $@
do
  echo "Package need to install: $i"
  dnf list installed $i
  if [ $? -eq 0]
  then
      echo " $i already installed "
   else
      echo " $i need to be installed "
done