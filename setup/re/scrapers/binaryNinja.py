#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re

response = requests.get('https://binary.ninja/demo/')

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile('^https://*(.+)\.zip')})
print(links[0].get('href'))