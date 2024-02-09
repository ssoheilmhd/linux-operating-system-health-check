#!/bin/bash
echo "####################################################################################################"
echo "online CPUs:" 
cat /sys/devices/system/cpu/online
echo "####################################################################################################"
echo "offline CPUs:"
cat /sys/devices/system/cpu/offline
echo "####################################################################################################"
echo "CPU state:"
iostat -c
echo "####################################################################################################"
echo "These are 10 big process in your CPU:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head
echo "####################################################################################################"
