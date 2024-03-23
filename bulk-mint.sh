#!/bin/bash

#check that 3 arguments are passed in otherwise exit
if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters"
    echo "Usage: bulk-mint.sh <max_count> <target_address> <token_name>"
    exit 1
fi

count=0
max_count=$1
target_address=$2
token_name=$3
while [ $count -lt $max_count ]; do
    echo "Current count: $count"
    node . drc-20 mint DE37nDv3vAz84jNdtuM1Mj7c4kjzPX7z6S wen 5000 12
    remaining=$((max_count - count))
    echo "Counts left: $remaining"
    sleep 30  # Sleep for 3,5 minutes
    ((count++))
done
