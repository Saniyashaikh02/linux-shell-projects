#!/bin/bash

LOGFILE="system_health.log"

echo "----- $(date) -----" >> $LOGFILE

df -h | tail -n +2 | while read line
do
    usage=$(echo "$line" | awk '{print $5}' | sed 's/%//')

    if [ "$usage" -gt 80 ]; then
        echo "High Disk Usage: $line" >> $LOGFILE
    fi
done

echo "Check completed" >> $LOGFILE
