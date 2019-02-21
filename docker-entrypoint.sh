#!/bin/bash

set -e
whoami
env

#exec "$@"
/bin/bash -c "$@"

tail -f /dev/null

