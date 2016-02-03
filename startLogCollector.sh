#!/bin/sh

docker run -d --restart=on-failure -v /var/run/docker.sock:/var/run/docker.sock:ro --link elk_redis_1 logstash-redis-collector redis://redis?key=logstash
