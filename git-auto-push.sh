#!/bin/bash
#A simple bash script that strings together the necessary commands to push to a repo.
#Simple type ./git-auto-push followed by the message (no "")
git add .
git commit -m "$1"
git push
