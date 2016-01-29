IMAGE=elk-dev

build:
	docker build -t ${IMAGE} .

run:
	docker run -it -p 5601:5601 -p 9200:9200 -v ${PWD}/config:/config -v ${PWD}/elasticsearch-2.1.1:/elk/elasticsearch -v ${PWD}/logstash-2.1.1:/elk/logstash -v ${PWD}/kibana-4.3.1-linux-x64:/elk/kibana ${IMAGE} bash
