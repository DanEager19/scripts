#!/usr/bin/env python3

import re
import json

f = open('injects.json')

injects = json.load(f)

for inject in injects["injects"]:
    print(inject)

f.close()