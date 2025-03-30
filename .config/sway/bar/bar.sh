#!/bin/bash

DATE=$(date +'%a>%Y-%m-%d %H:%M:%S')

SSD_PERCENT=$(df -h | grep nvme0n1p2 | awk -F' ' $'{ printf $5 }')
HDD_PERCENT=$(df -h | grep sda1 | awk -F' ' $'{ printf $5 }')

PM_STATUS=$(< $HOME/.config/sway/bar/status)

# waittime being 1 second means:
#   server up: updates on time
#   server dn: skips a second
# solution: run in diff script, update WL_STATUS or a file, then can just read that file

# get some form of input from water lily then display it on center status bar

echo Water Lily\>$PM_STATUS \| HDD\>$HDD_PERCENT SSD\>$SSD_PERCENT \| $DATE
