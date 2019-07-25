#!/bin/bash
set -x
IP=$(/sbin/ifconfig | /usr/local/bin/ggrep -E -o '10\.(171|252)\.[0-9]{1,3}\.[0-9]{1,3}' | head -n 1)
PROC=$(ps aux | grep 'caffeinate' | awk '{print $2}')

if [ -z "$IP" ]
  then
    kill $PROC
  else
   echo $PROC
    if [ $(echo $PROC | wc -w) -gt 3 ]
      then
        :
      else
        /usr/bin/osascript -e 'display notification "caffeinating... ☕️" with title "Cron"'
        caffeinate -id &
    fi
fi

# Log errors
if [ $? -gt 0 ]; then
  echo "Failed to caffeinate or kill: $RESPONSE"
  exit 1
fi
