#! /bin/bash
ip_file=$1
action=$2
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	echo $ip
        ssh pi@${ip} "sudo ${action}"&
done < $ip_file

