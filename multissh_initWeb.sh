#! /bin/bash
ip_file=$1
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	echo ${ip}
        ssh pi@${ip} sudo /home/pi/task/script/browse_init.sh&
done < $ip_file

