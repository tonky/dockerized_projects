#!/bin/bash
if [  $# -le 1 ]
then
	echo "Restores docker data volumes from the file in ~/projects/.backup"
	echo -e "\nUsage: $0 <volume_name> <date>"
	echo "Result: volume with data from previous backup in ~/projects/.backup/<volume_name>_<date>.tar"

	exit 1
fi

docker run --rm -v $1:/data -v ~/projects/.backup:/backup busybox tar xvf /backup/$1_$2.tar
