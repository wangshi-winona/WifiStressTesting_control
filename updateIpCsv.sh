#! /bin/bash
source connection.conf
echo 'Updating ip.csv from '${ipCsvLink}
curl ${ipCsvLink} -o ip.csv
cat ip.csv
