#! /bin/bash
ip_file=$1
numOfObj=$2
N=$3
r=$4
eid=$5
location=$6

while IFS='' read -r ip || [[ -n "$ip" ]]; do
	ssh pi@${ip} "sudo /home/pi/task/script/reach.sh trtcp; sudo python /home/pi/task/py/trtcp_obj.py ${numOfObj} ${N} ${r} ${eid} ${location}"&
done < $ip_file
