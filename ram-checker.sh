#!/bin/bash
#collect data from memory to find the percentage of usage

TotalMemory=`free -h | grep Mem | awk '{print $2}' | cut -d "G" -f 1`
UsedMemory=`free -h | grep Mem | awk '{print $3}' | cut -d "G" -f 1`
PercentageDividingUsageByTotal=$(echo "scale=2; $UsedMemory * 100 / $TotalMemory" | bc)
echo ${PercentageDividingUsageByTotal}%

#find 10 big process which they are using memory with their PID ,MemPercentage and their command
ps aux --sort=-%mem | head | awk '{print $2" "$4 " " $11}'
