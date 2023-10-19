#!/usr/bin/env python3
import requests

url = 'https://detectportal.firefox.com/success.txt'
page = requests.get(url)

print(page.text)