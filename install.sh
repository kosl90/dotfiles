#!/bin/sh

# TODO: different distribution or platform has different package name,
# use different file for distribution or platform. This may also leads
# to dropping this install.sh file.
if [ -f /etc/os-release ]; then
    OS=`grep -w ID /etc/os-release | cut -d= -f2`
else
    OS=`uname`
fi

echo "OS: $OS"

if [ X"$OS" = X"arch" ]
then
    INS="pacman -S"
elif [ X"$OS" = X"Darwin" ]; then
    echo 'not support mac now'
    # TODO: not support now
    # INS="brew install"
else
    INS="apt-get install"
fi

#echo $INS

if [ ! $USER = "root" ] && [ X$INS != X"" ];
then
    INS="sudo $INS"
fi


make -f Makefile.real -e INS="$INS" $1
