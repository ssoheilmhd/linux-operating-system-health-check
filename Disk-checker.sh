#!/bin/bash
echo "display mount points states:"

df -h

echo "10 big directories in your system:"
sudo du -a / 2> /dev/null  | sort -n -r | head