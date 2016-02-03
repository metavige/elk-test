FROM alpine:3.2

COPY conf.d/* /etc/logstash/conf.d/
COPY patterns/* /opt/logstash/patterns/

VOLUME /etc/logstash/conf.d
VOLUME /opt/logstash/patterns
