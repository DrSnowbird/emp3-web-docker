#!/bin/bash

set -e
whoami
env
id

sudo service nginx start

/bin/bash -c "$*"

tail -f /dev/null

