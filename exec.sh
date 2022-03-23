#!/bin/sh

echo "timezone=${TZ}"

echo "$(date) - start backup scheduler"
while :; do
    DATE=$(date +%Y%m%d-%H%M%S)

    echo "$(date) - execute backup ${DATE}"
    imap-backup backup

    echo "$(date) - sleep for 1 day"
    sleep 1d
done