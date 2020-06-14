#!/bin/bash
set -e

help() {
cat << EOF

This container is intended to be run with X11 socket connection, and repository mounted as /repo ie:

docker run -e DISPLAY=unix\$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v \$(pwd):/repo izilef/tortoisehg

If you want to use persistent configuration for thg, the easiest way is to use named volume as home directory, ie:

docker run -e DISPLAY=unix\$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v \$(pwd):/repo -v tortoisehg-home:/home/tortoisehg izilef/tortoisehg

EOF
}

if [ "$1" == "--help" ]; then
    help
    exit 0
fi

if [ -z "$DISPLAY"  ]; then
    echo "ERROR: DISPLAY is not set"
    help
    exit 1
fi
if [ ! -d "/tmp/.X11-unix"  ]; then
    echo "ERROR: DISPLAY is not set"
    help
    exit 2
fi

if [ -z "$(ls -A /repo )" ]; then
    echo "ERROR: No repository found in /repo"
    help
    exit 3
fi

if ! mountpoint /home/tortoisehg; then
    echo "WARNING: /home/tortoisehg is not persistent, settings for thg will be lost, see --help"
fi

exec "$@"


