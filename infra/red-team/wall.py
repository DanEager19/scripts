#!/usr/bin/env python3
import random, os, time

while True:
    x = random.randrange(1, 10)
    time.sleep(x * 60)
    os.system("wall \"Uh oh! Looks like someone is installing a rootkit! Better remove it quick!\n\"")