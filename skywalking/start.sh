#!/bin/bash

# feilong <weifeilong2013@gmail.com>

cd /data/es && nohup ./bin/elasticsearch -Ecluster.name=CollectorDBCluster -Enode.name=CollectorDBNode &> /dev/null &

cd /data/skywalking ./bin/startup.sh
