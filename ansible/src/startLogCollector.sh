#!/bin/sh

docker run -d --restart=always -v /var/run/docker.sock:/var/run/docker.sock:ro logstash-redis-collector redis://192.168.0.112?key=logstash
