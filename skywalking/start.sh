#!/bin/bash

# feilong <weifeilong2013@gmail.com>

set -e

cd /data/es && nohup ./bin/elasticsearch -Ecluster.name=CollectorDBCluster -Enode.name=CollectorDBNode &> /dev/null &

# ensure es is running
printf "Elasticsearch is starting"
while true; do curl -I http://127.0.0.1:9200 &> /dev/null && break || printf "." && sleep 1; done
echo

cd /data/skywalking && ./bin/startup.sh

sleep infinity
