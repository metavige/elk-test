for dname in "elasticsearch" "kibana" "logstash" "redis"
do
  docker pull "registry.co/base/$dname"
  docker tag -f "registry.co/base/$dname" "$dname"
done

for dname in "logstash-redis-collector"
do
  docker pull "registry.co/nebula/$dname"
  docker tag -f "registry.co/nebula/$dname" "$dname"
done
