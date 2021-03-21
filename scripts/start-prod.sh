#!/bin/bash
ENV=prod

for P in $(ps aux | grep grails | grep java |grep 8090 |awk '{print $2};'); do
   kill -9 $P
done
cd $ENV/
git pull origin v1.0.2
grails prod run-app -port=8090 >> log-$ENV.out  &
