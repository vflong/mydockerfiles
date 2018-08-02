#!/bin/bash

# feilong <weifeilong2013@gmail.com>

set -ex

cd /data/es && nohup ./bin/elasticsearch -Ecluster.name=CollectorDBCluster -Enode.name=CollectorDBNode &> /dev/null &

# ensure es is running
sleep 30

cd /data/skywalking && ./bin/startup.sh

tail -f /data/skywalking/logs/skywalking-collector-server.log
