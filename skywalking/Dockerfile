FROM vflong/jdk8
MAINTAINER feilong <weifeilong2013@gmail.com>

WORKDIR /data

RUN wget http://mirrors.hust.edu.cn/apache/incubator/skywalking/5.0.0-beta2/apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz && \
    wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.10.tar.gz
    
RUN tar xf apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz && \
    ln -snf apache-skywalking-apm-incubating skywalking && \
    rm apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz

RUN tar xf elasticsearch-5.6.10.tar.gz && \
    ln -snf elasticsearch-5.6.10 es && \
    rm elasticsearch-5.6.10.tar.gz

COPY start.sh /data

ENV JAVA_HOME /data/jdk
ENV JRE_HOME /data/jdk/jre
ENV PATH "$PATH:$JAVA_HOME/bin"

RUN groupadd -g 1000 skywalking && useradd skywalking -u 1000 -g 100 && \
    chown -R skywalking. /data && \
    chmod +x /data/start.sh

USER skywalking

EXPOSE 8080 10800

CMD ["/usr/bin/bash", "/data/start.sh"]
