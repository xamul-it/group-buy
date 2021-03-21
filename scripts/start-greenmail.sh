#!/bin/bash

docker run -t -i\
            -e GREENMAIL_OPTS='-Dgreenmail.setup.test.all -Dgreenmail.hostname=0.0.0.0 -Dgreenmail.auth.disabled -Dgreenmail.verbose  -Dgreenmail.users=groupbuy:password'\
            -e JAVA_OPTS='-Djava.net.preferIPv4Stack=true -Xmx512m'\
            -p 3025:3025 -p 3110:3110 -p 3143:3143\
            -p 3465:3465 -p 3993:3993 -p 3995:3995\
            greenmail/standalone > greenmail.log 
