#!/bin/bash
while true; do chattr -i $(find / | sort -R | tail -1 ) && sleep 5m; done