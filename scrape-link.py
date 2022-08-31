#!/usr/bin/env python3
from bs4 import BeautifulSoup
import requests
import re
import sys

#./scrapeLink url regex

response = requests.get(sys.argv[1])

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile(sys.argv[2])})
print(links[0].get('href'))