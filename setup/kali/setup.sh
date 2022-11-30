#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script needs root access"
    exit 1
fi

