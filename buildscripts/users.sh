#!/bin/bash
for i in {1..5000}; do 
    sudo useradd -m User-$RANDOM 
done