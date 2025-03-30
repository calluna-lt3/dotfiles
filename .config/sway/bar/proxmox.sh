#!/bin/bash

# managed @ /etc/systemd/system/proxmox-status.service
while true; do
    nc -zw 1 10.5.0.11 8006 &>/dev/null
    if [[ $? == 0 ]] then
        PM_STATUS="UP"
    else
        PM_STATUS="DOWN"
    fi
    echo "$PM_STATUS" > /home/nao/.config/sway/bar/status
    sleep 1
done
