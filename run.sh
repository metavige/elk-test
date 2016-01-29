#!/bin/bash

gosu elasticsearch elasticsearch &
logstash agent -f /elk/logstash/config/logstash.conf &
kibana
