#!/bin/sh
OS=`grep -w ID /etc/os-release | cut -d= -f2`
echo "OS: $OS"

if [ X"$OS" = X"arch" ]
then
    INS="pacman -S"
else
    INS="apt-get install"
fi

#echo $INS

if [ ! $USER = "root" ]
then
    INS="sudo $INS"
fi


make -f Makefile.install -e INS="$INS" $1
