#!/bin/bash
set -e

if [[ "$*" == npm*start* ]]; then

	chown -R user "$GHOST_CONTENT"

	cat /hosts >> /etc/hosts

	set -- gosu user "$@"
fi

exec "$@"
