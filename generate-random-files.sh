#!/bin/bash

if [ $# -ne '2' ]; then
  echo "Usage: $0 <amount of files> <size in Byte>"
  exit 1
fi

for (( c=1; c<=$1; c++ ))
do
	dd if=/dev/zero of=file$c bs=$2 count=1
done
 
exit 0
