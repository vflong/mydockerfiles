FROM vflong/jdk8
MAINTAINER feilong <weifeilong2013@gmail.com>

WORKDIR /data

RUN wget http://mirrors.hust.edu.cn/apache/incubator/skywalking/5.0.0-beta2/apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz && \
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.10.tar.gz
    
RUN tar xf apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz && \
    ln -snf apache-skywalking-apm-incubating-5.0.0-beta2 skywalking && \
    rm apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz

RUN tar xf elasticsearch-5.6.10.tar.gz && \
    ln -snf elasticsearch-5.6.10 es && \
    rm elasticsearch-5.6.10.tar.gz

COPY start.sh /data

CMD ["/data/start.sh"]
