#! /bin/bash
source connection.conf
echo 'Configure connection with IP server ...'
echo ${ipServerIp} $ipServerSshPort
ssh-keyscan -p ${ipServerSshPort} ${ipServerIp} >> ~/.ssh/known_hosts

echo 'Done'
echo
