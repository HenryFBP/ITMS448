#!/usr/bin/env bash

docker pull vulnerables/web-dvwa

docker run --rm -it -p 80:80 vulnerables/web-dvwa
