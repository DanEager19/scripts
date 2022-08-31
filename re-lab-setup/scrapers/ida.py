#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re

response = requests.get('https://hex-rays.com/ida-free/')

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile('^https://*(.+)linux\.run$')})
print(links[0].get('href'))