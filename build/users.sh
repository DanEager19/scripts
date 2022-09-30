#!/bin/bash
for i in {1..5000}; do useradd -m User-$RANDOM; done