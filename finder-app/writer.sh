#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Incorrect number of arguments. Number of arguments must be 2."
    exit 1
fi

writefile=$1
writestr=$2

dirname=($(dirname ${writefile}))

# Check if directory exists, if not, create it
if [ ! -d $dirname ]; then
    mkdir -p ${dirname}
fi

# Create file if it does not exist
touch ${writefile} &>/dev/null

# Write to file if it exists and user has write access
if [ -w $writefile ]
then
    echo ${writestr} > ${writefile}
    exit 0
else
    echo "Error: file could not be written"
    exit 1
fi
