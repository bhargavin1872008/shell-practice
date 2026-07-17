#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

PACKAGES=( "mysql" "nginx" "python3" )

VALIDATE( ){
    if [ $1 -eq 0 ]
        then
            echo -e "Installing $2 is ...$G SUCCESS $N"
        else
            echo -e "Installing $2 is ...$R FAILURE $N"
            exit 1
        fi
}

if [ $USERID -ne 0 ]
then
    echo -e " $R ERROR:: Please run this script with root access $N"
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"
fi

for package in $@
{
    dnf list installed "${PACKAGES[@]}"
    if [ $? -ne 0 ]
    then
        echo "$package is not installed... going to install it" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
        
    else
        echo -e "Nothing to do $package... $Y already installed $N" | tee -a $LOG_FILE
    fi
}

#dnf list installed python

    # dnf list installed python3.12
    # if [ $? -ne 0 ]
    # then
    #     echo "python4 is not installed... going to install it"
    #     dnf install python3.12 -y
    #     VALIDATE $? "python3.12"
    # else
    #     echo "python3.12 is already installed...Nothing to do"
    # fi

    # dnf list installed mysql
    # if [ $? -ne 0 ]
    # then
    #     echo "mysql is not installed... going to install it"
    #     dnf install mysql -y
    #     VALIDATE $? "mysql"
        
    # else
    #     echo "mysql is already installed...Nothing to do"
    # fi