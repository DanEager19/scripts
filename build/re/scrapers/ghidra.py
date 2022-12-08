#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re

headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0'
}

response = requests.get('https://github.com/NationalSecurityAgency/ghidra/releases', headers=headers)

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile('^/NationalSecurityAgency/ghidra/releases/download/*(.+)\.zip$')})
print('https://github.com' + links[0].get('href'))