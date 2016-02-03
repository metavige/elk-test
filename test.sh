#!/bin/bash

n=$((RANDOM % 20 + 10))

for (( i=1; i<${n}; i=i+1  ))
do 
#	echo "run $i time"
	curl localhost
done