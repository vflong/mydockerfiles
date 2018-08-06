#!/bin/bash

# feilong <weifeilong2013@gmail.com>

set -e

password=$(date +%s | sha256sum | base64 | head -c 20 ; echo)
echo $password > /data/password.txt
sed -i "s/password: admin/password: $password/g" /data/skywalking/webapp/webapp.yml

ip=$(ifconfig eth0 | awk '/inet/ && !/inet6/ {print $2}')

cd /data/es && nohup ./bin/elasticsearch -Ecluster.name=CollectorDBCluster -Enode.name=CollectorDBNode -Enetwork.host=$ip &> /dev/null &
sed -i "s/127.0.0.1/$ip/g" /data/skywalking/webapp/webapp.yml
sed -i "s/localhost/$ip/g" /data/skywalking/config/application.yml

# ensure es is running
printf "Elasticsearch is starting"
while true; do curl -I http://$ip:9200 &> /dev/null && break || printf "." && sleep 1; done
echo

echo "Elasticsearch Application started successfully!"

cd /data/skywalking && ./bin/startup.sh

sleep infinity