#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"

fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "Installing nginx is ... SUCCESS"
    else
        echo "Installing nginx is ... FAILURE"
        exit 1
    fi
else
    echo "nginx is already installed...Nothing to do"
fi

#dnf list installed python

dnf list installed python3.12
if [ $? -ne 0 ]
then
    echo "python4 is not installed... going to install it"
    dnf install python3.12 -y
    dnf install python3.12 -y
    if [ $? -eq 0 ]
    then
        echo "Installing python3.12 is ... SUCCESS"
    else
        echo "Installing python3.12 is ... FAILURE"
        exit 1
    fi
else
    echo "python4 is already installed...Nothing to do"
fi

if [ $? -ne 0 ]
then
    echo "python3.12 is not installed... going to install it"
    dnf install python3.12 -y
    if [ $? -eq 0 ]
    then
        echo "Installing MySQL is ... SUCCESS"
    else
        echo "Installing MySQL is ... FAILURE"
        exit 1
    fi
else
        echo "MySQL is already installed...Nothing to do"
fi


dnf list installed java