#!/bin/sh

echo "timezone=${TZ}"

echo "$(date) - start backup scheduler"
while :; do
    DATE=$(date +%Y%m%d-%H%M%S)

    echo "$(date) - execute backup ${DATE}"
    imap-backup backup

    echo "$(date) - sleep for 1 day"

    if [ -z "$OWNER" ]
    then
        # https://github.com/joeyates/imap-backup/issues/88
        # because at now imap-backup can't work with custom folders 
        # and work in root dir with another UID it's problematic
        echo "change owner to ${OWNER}"
        chown -R $OWNER /root/.imap-backup/
    else

    sleep 1d
done