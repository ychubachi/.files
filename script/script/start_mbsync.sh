#!/bin/sh

while true
do
    echo "[mbsync]"
    mbsync -a
    echo "[notmuch new]"
    notmuch new
    sleep 10
done
