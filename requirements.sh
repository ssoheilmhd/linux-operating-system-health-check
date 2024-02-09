#!/bin/bash
#it will install your requirements which they are not present in your distribution

toolsCheck() {
echo "####################################################################################################"
echo "Check if $1 is installed..."
$1 -V &> /dev/null
toolExists=`echo $?`
if [[ $toolExists == 0 ]]; then
echo "$1 is ready"
else
echo "####################################################################################################"
echo "unfortunately $1 does not exist"
fi
}

toolsInstallation() {
ls /etc/lsb-release >& /dev/null
DistroIsDebianBase=`echo $?`
ls /etc/redhat-release >& /dev/null
DistroIsRedhatBase=`echo $?`
echo "try to install $1..."
if [[ $DistroIsDebianBase == 0 ]]; then
sudo apt install $1
elif [[ $DistroIsRedhatBase == 0 ]]; then
sudo yum -y install $1
else
echo "####################################################################################################"
echo "it seems your distribution is not redhat base or debian base, please install $1 manually"
echo "####################################################################################################"
fi
}

Checker() {
toolsCheck "$1"
if [[ $toolExists != 0 ]]; then

if [[ "iostat" == `echo $1` ]]; then
toolsInstallation "sysstat"
else
toolsInstallation "$1"
fi

toolsCheck "$1"
fi
}

