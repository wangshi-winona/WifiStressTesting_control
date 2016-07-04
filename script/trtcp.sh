#! /bin/bash
ip_file=$1
#N=$2
#r=$3
#eid=$4
#location=$5

while IFS='' read -r ip || [[ -n "$ip" ]]; do
	ssh pi@${ip} sudo trtcp -l 0 -R -z 65535 -O -C -S -N 2 -r 2 'http://www.google.com.hk' &
done < $ip_file
