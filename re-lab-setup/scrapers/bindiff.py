#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re

response = requests.get('https://www.zynamics.com/software.html')

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile('^https://dl\.google\.com/zynamics/bindiff*(.+)amd64\.deb')})
print(links[0].get('href'))