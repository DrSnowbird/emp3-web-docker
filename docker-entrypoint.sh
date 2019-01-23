#!/bin/bash

set -e

env

#exec "$@"
/bin/bash -c "$@"

tail -f /dev/null

