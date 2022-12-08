#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re

headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0'
}

response = requests.get('https://software.opensuse.org/download/package?package=cutter-re&project=home%3ARizinOrg', headers=headers)

soup = BeautifulSoup(response.text, 'html.parser')

links = soup.find_all('a', attrs={'href': re.compile('^https://download.opensuse.org/repositories/home:/RizinOrg/xUbuntu*(.+)amd64\.deb$')})
print(links[0].get('href'))