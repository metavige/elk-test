FROM java:8-jre
MAINTAINER Ricky Chiang <metavige@gmail.com>

# grab gosu for easy step-down from root
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN arch="$(dpkg --print-architecture)" \
  && set -x \
  && curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch" \
  && curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch.asc" \
  && gpg --verify /usr/local/bin/gosu.asc \
  && rm /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu

RUN set -ex \
  && echo 'Acquire::https { Proxy "http://192.168.0.103:3142"; };' >> /etc/apt/apt.conf.d/20proxy \
  && echo 'Acquire::http { Proxy "http://192.168.0.103:3142"; };' >> /etc/apt/apt.conf.d/20proxy \
  && apt-get update \
  && apt-get install -y --no-install-recommends vim curl tree htop nginx \
  && groupadd -r elasticsearch && useradd -r -m -g elasticsearch elasticsearch \
  && groupadd -r logstash && useradd -r -m -g logstash logstash \
  && groupadd -r kibana && useradd -r -m -g kibana kibana \
  && for path in \
    /data/data \
    /data/logs \
    /data/plugins \
    /data/config \
    /data/work \
    /data/scripts \
  ; do \
    mkdir -p "$path"; \
    chown -R elasticsearch:elasticsearch "$path"; \
  done

ENV PATH=/elk/elasticsearch/bin:/elk/logstash/bin:/elk/kibana/bin:$PATH

EXPOSE 5601 9200 9300
