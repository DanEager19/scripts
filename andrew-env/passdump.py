#!/usr/bin/python3

fr = open('/etc/passwd', 'r')
data = fr.readlines()
fr.close()

fw = open('/root/dump.csv', 'a+')
fw.writelines(data)
fw.close()