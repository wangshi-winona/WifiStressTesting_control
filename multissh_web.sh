#! /bin/bash
source connection.conf
ip_file=$1
interval=$2
repeat=$3
eid=$4
location=$5
#pssh -P -i -h ${ip_file} -l pi -A "sudo /home/pi/task/script/browseweb.sh -i ${interval} -l ${repeat}"
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	ssh pi@${ip} "sudo ${mainPath}/script/reach.sh web; sudo python ${mainPath}/py/browse.py ${interval} ${repeat} ${eid} ${location}"&
done < $ip_file
