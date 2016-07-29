#! /bin/bash
source connection.conf
ip_file=$1
server_ip=$2
video_file=$3
eid=$4
location=$5
arr=()
while IFS='' read -r line || [[ -n "$line" ]]; do
	#echo "Read from file: $line"
	arr+=(${line})
done < $video_file
count=0
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	i=$((count%${#arr[@]}))
	#echo $i
	#echo ${ip}': loading '${arr[${i}]}
	ssh pi@${ip} "sudo ${mainPath}/script/reach.sh video; sudo python ${mainPath}/py/pyselenium.py ${server_ip} ${arr[${i}]} ${eid} ${location}"&
	((count+=1))
done < $ip_file
