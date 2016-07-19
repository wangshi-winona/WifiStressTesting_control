#! /bin/bash
source connection.conf
ip_file=$1
interval=$2
repeat=$3
eid=$4
location=$5

while IFS='' read -r ip || [[ -n "$ip" ]]; do
	ssh pi@${ip} "sudo ${mainPath}/script/reach.sh quality; sudo python ${mainPath}/py/wifiQuality.py ${interval} ${repeat} ${eid} ${location}"&
done < $ip_file
