#!/usr/bin/env bash

#Kill running polybars
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#Launch bar 1 and 2
echo "---" | tee -a /tmp/polybar1.log
polybar bar1 >>/tmp/polybar1.log

echo "Bar launched"