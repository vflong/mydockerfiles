FROM centos:7
MAINTAINER feilong <weifeilong2013@gmail.com>

ENV JDK jdk-8u181-linux-x64.tar.gz

ENV TZ Asia/Shanghai
ENV JAVA_HOME /data/jdk
ENV JRE_HOME /data/jdk/jre
ENV PATH "$PATH:$JAVA_HOME/bin"

RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install vim wget net-tools telnet && \
    rm -rf /var/cache/yum

WORKDIR /data

RUN curl -fsL "https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim" -o /root/.vimrc && \
    ln -snf /usr/share/zoneinfo/$TZ  /etc/localtime && echo $TZ > /etc/timezone && \
    cd /data && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/$JDK && \
    tar xf $JDK && \
    ln -snf jdk1.8.0_181 jdk && \
    rm -f /data/$JDK
