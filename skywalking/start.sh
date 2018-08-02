#!/bin/bash

# feilong <weifeilong2013@gmail.com>

set -ex

cd /data/es && nohup ./bin/elasticsearch -Ecluster.name=CollectorDBCluster -Enode.name=CollectorDBNode &> /dev/null &
cd /data/skywalking && ./bin/startup.sh

sleep 30
tail -f /data/skywalking/logs/skywalking-collector-server.log
