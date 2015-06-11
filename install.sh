#!/bin/sh
OS=`grep ID /etc/os-release | cut -d= -f2`

if [ $OS = "arch" ]
then
    INS="pacman -S"
else
    INS="apt-get install"
fi

echo $INS

if [ ! $USER = "root" ]
then
    INS="sudo $INS"
fi


make -f Makefile.install -e INS="$INS" $1
