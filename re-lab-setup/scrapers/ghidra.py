#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re

response = requests.get('https://github.com/NationalSecurityAgency/ghidra/releases')

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile('^/NationalSecurityAgency/ghidra/releases/download/*(.+)\.zip$')})
print('https://github.com' + links[0].get('href'))