#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re

response = requests.get('https://software.opensuse.org/download/package?package=cutter-re&project=home%3ARizinOrg')

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile('^https://download.opensuse.org/repositories/home:/RizinOrg/xUbuntu*(.+)amd64\.deb$')})
print(links[0].get('href'))