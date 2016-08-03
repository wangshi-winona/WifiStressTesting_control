#! /bin/bash
ip_file=$1
from_path=$2
to_path=$3
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	echo $ip
	sshpass -p 'raspberry' scp $from_path pi@${ip}:${to_path}
done < $ip_file

