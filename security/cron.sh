#!/bin/bash
for cron in $(ls /etc | grep cron); do chown root:root /etc/$cron; chmod 600 /etc/$cron; done