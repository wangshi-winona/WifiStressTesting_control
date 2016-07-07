#! /bin/bash
ip_file=$1
interval=$2
repeat=$3
eid=$4
location=$5
#pssh -P -i -h ${ip_file} -l pi -A "sudo /home/pi/task/script/browseweb.sh -i ${interval} -l ${repeat}"
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	ssh -y pi@${ip} "sudo /home/pi/task/script/reach.sh web; sudo python /home/pi/task/py/browse.py ${interval} ${repeat} ${eid} ${location}"&
done < $ip_file
