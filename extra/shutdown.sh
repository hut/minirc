#!/bin/sh

case "$2" in
    ''|now)
        TIME=0;;
    *)
        TIME="$2";;
esac

case "$1" in
    -H|--halt)
        sleep $TIME
        /sbin/halt;;
    -P|--poweroff)
        sleep $TIME
        /sbin/poweroff;;
    -r|--reboot)
        sleep $TIME
        /sbin/reboot;;
    -c)
        pkill shutdown;;
esac
