#!/bin/sh

case "$1" in
    pre)
        /usr/bin/pkill go-librespot
        ;;
esac
