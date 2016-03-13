#!/bin/bash
if [  $# -lt 1 ]
then
	echo "Back up your docker data volumes stamped by date to ~/projects/.backup"
	echo -e "\nUsage: $0 <volume_name>"
	echo "Result: backup in ~/projects/.backup/<volume_name>_<current_date>.tar"

	exit 1
fi

mkdir -p ~/projects/.backup
docker run --rm -v $1:/data -v ~/projects/.backup:/backup busybox tar cvf /backup/$1_$(date +%d-%m-%y).tar /data
