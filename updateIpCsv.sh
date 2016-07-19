#! /bin/bash
source connection.conf
echo 'Updating ip.csv from '${ipServerIp}' port '${ipServerSshPort}' '${ipServerIpPath}'/ip.csv'
sshpass -p $ipServerPwd scp -P ${ipServerSshPort} ${ipServerHostName}@${ipServerIp}:${ipServerIpPath}/ip.csv ip.csv
echo 'Done'
cat ip.csv
