#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Error: Incorrect number of arguments. Number of arguments must be 2."
    exit 1
fi

filesdir=$1
searchstr=$2

if [ -d $filesdir ]
then
    X=$(find $filesdir -type f | wc -l)
    Y=$(grep -r $searchstr $filesdir | wc -l)
    echo "The number of files are $X and the number of matching lines are $Y"
    exit 0
else
    echo "Error: Path provided does not represent directory on filesystem."
    exit 1
fi
