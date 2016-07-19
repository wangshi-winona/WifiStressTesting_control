#! /bin/bash
source connection.conf
ip_file=$1
server_ip=$2
eid=$3
location=$4
video_file='video.txt'
arr=()
while IFS='' read -r line || [[ -n "$line" ]]; do
	#echo "Read from file: $line"
	arr+=(${line})
done < $video_file
count=0
while IFS='' read -r ip || [[ -n "$ip" ]]; do
	i=$((${count}%${#arr[@]}))
	#echo ${ip}': loading '${arr[${i}]}
	ssh pi@${ip} "sudo ${mainPath}/script/reach.sh video; sudo python ${mainPath}/py/pyselenium.py ${server_ip} ${arr[${i}]} ${eid} ${location}"&
	count=${count}+1
done < $ip_file
