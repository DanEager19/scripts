#!/bin/bash
#A simple bash script that strings together the necessary commands to push to a repo.
git add .
git commit -m "$1"
git push
