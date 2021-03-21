#!/bin/bash
#docker run -p 1080:80 -p 1025:25 maildev/maildev &
for P in $(ps aux | grep grails | grep java |grep 8080 |awk '{print $2};'); do
   kill -9 $P
done
cd test/
git pull origin dev
grails dev run-app -port=8080 >> log.out &
