#! /bin/bash
source connection.conf
sshpass -p ${ipServerPwd} ssh ${ipServerHostName}@${ipServerIp} -p ${ipServerSshPort} python ${ipServerIpPath}/clearIpList.py
