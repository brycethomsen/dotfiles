#!/bin/bash

IP=$(/sbin/ifconfig | /usr/local/bin/ggrep -E -o '10\.(171|252)\.[0-9]{1,3}\.[0-9]{1,3}' | head -n 1)

if [ -z "$IP" ]
  then
    kill $(ps aux | grep 'caffeinate' | awk '{print $2}')
  else
    if [ $(ps aux | grep 'caffeinate' | awk '{print $2}' | wc -l) -gt 1 ]
      then
        exit 0
      else
        /usr/bin/osascript -e 'display notification "caffeinating... ☕️" with title "Cron"'
        caffeinate -id &
        exit 0
    fi
fi

# Log errors
if [ $? -gt 0 ]; then
  echo "Failed to caffeinate or kill: $RESPONSE"
  exit 1
fi
