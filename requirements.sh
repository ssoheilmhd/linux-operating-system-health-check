#!/bin/bash
#it will install your requirements which they are not present in your distribution
iostatCheck() {
echo "####################################################################################################"
echo "Check if iostat is installed..."
iostat > /dev/null
iostatExists=`echo $?`
if [[ $iostatExists == 0 ]]; then
echo "iostat is ready"
else
echo "####################################################################################################"
echo "unfortunately iostat doesnt exist, If you tried with this script and failed to install it, we suggest you to install it manually"
fi
}


sysstatInstallation() {
ls /etc/lsb-release >& /dev/null
DistroIsDebianBase=`echo $?`
ls /etc/redhat-release >& /dev/null
DistroIsRedhatBase=`echo $?`

if [[ $DistroIsDebianBase == 0 ]]; then
sudo apt install sysstat
elif [[ $DistroIsRedhatBase == 0 ]]; then
sudo yum -y install sysstat
else
echo "####################################################################################################"
echo "it seems your distribution is not redhat base or debian base, please install sysstat manually"
echo "####################################################################################################"
fi
}

iostatCheck
if [[ $iostatExists != 0 ]]; then
sysstatInstallation
iostatCheck
fi
