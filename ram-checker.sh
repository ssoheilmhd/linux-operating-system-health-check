#!/bin/bash
#collect data from memory to find the percentage of usage

TotalMemory=`free -m | grep Mem | awk '{print $2}'`
UsedMemory=`free -m | grep Mem | awk '{print $3}'`
PercentageDividingUsageByTotal=$(echo "scale=2; $UsedMemory * 100 / $TotalMemory" | bc)
echo ${PercentageDividingUsageByTotal}%

#find 10 big process which they are using memory with their PID ,MemPercentage and their command
ps aux --sort=-%mem | head | awk '{print $2" "$4 " " $11}'
