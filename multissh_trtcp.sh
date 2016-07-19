#! /bin/bash
source connection.conf
ip_file=$1
numOfObj=$2
N=$3
r=$4
eid=$5
location=$6

while IFS='' read -r ip || [[ -n "$ip" ]]; do
	ssh pi@${ip} "sudo ${mainPath}/script/reach.sh trtcp; sudo python ${mainPath}/py/trtcp_obj.py ${numOfObj} ${N} ${r} ${eid} ${location}"&
done < $ip_file
