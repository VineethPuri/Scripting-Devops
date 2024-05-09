#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo " please run this script with superuser "
    exit 1 
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
   echo " MYSQL installation is failed "
   exit 1
else 
   echo " Installation of MYSQL is success "
fi

dnf install git -y

if [ $? -ne 0 ]
then
   echo " GIT installation is failed "
else
   echo " GIT installation is success "
fi