#!/bin/bash

# feilong <weifeilong2013@gmail.com>

set -e

ps -ef | grep java | grep -v grep | awk '{print $2}' | xargs kill -9 &>/dev/null

cd /data/es && nohup ./bin/elasticsearch -Ecluster.name=CollectorDBCluster -Enode.name=CollectorDBNode &> /dev/null &

# ensure es is running
printf "Elasticsearch is starting"
while true; do curl -I http://127.0.0.1:9200 &> /dev/null && break || printf "." && sleep 1; done
echo

cd /data/skywalking && ./bin/startup.sh

sleep 365d
