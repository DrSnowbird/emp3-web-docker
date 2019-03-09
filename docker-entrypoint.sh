#!/bin/bash

set -e
whoami
env
id

/bin/bash -c "$*"

tail -f /dev/null

