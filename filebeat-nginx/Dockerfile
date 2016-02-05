FROM debian:jessie
MAINTAINER Ricky Chiang<github.com/metavige>

RUN echo 'Acquire::https { Proxy "http://192.168.0.103:3142"; };' >> /etc/apt/apt.conf.d/20proxy \
  && echo 'Acquire::http { Proxy "http://192.168.0.103:3142"; };' >> /etc/apt/apt.conf.d/20proxy \
  && apt-get update \
  && apt-get install -y nginx vim curl openssl \
  && curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.1.0_amd64.deb \
  && sudo dpkg -i filebeat_1.1.0_amd64.deb \
  && rm -f filebeat_1.1.0_amd64.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/*

ADD config/filebeat.yml /etc/filebeat/

EXPOSE 80

CMD ['nginx', '-g', '"daemon off;"']
