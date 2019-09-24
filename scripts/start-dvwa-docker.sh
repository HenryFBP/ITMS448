#!/usr/bin/env bash

service docker start

docker pull vulnerables/web-dvwa

docker run --rm -it -p 80:80 vulnerables/web-dvwa
