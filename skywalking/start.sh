#!/bin/bash

# feilong <weifeilong2013@gmail.com>

set -e

password=$(date +%s | sha256sum | base64 | head -c 20 ; echo)
echo $password > /data/password.txt
sed -i "s/password: admin/password: $password/g" /data/skywalking/webapp/webapp.yml

cd /data/es && nohup ./bin/elasticsearch -Ecluster.name=CollectorDBCluster -Enode.name=CollectorDBNode &> /dev/null &

# ensure es is running
printf "Elasticsearch is starting"
while true; do curl -I http://127.0.0.1:9200 &> /dev/null && break || printf "." && sleep 1; done
echo

cd /data/skywalking && ./bin/startup.sh

sleep infinity
