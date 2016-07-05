#! /bin/bash
all_ip="ip_all.txt"
server="-p 12422 158.132.255.20"
arr=()
echo 'Adding known hosts ...'
while IFS='' read -r line || [[ -n "$line" ]]; do
        arr+=(${line})
	#echo $line
done < $all_ip
for element in ${arr[@]};do
	echo $element
	ssh-keyscan $element >> ~/.ssh/known_hosts
done
echo $server
ssh-keyscan ${server} >> ~/.ssh/known_hosts
echo 'Done'
echo
