#!/bin/bash

#Check for root access
if [[ $EUID -ne 0 ]]; then
    echo "This script needs root access"
    exit 1
fi

#Install dependencies
apt-get install -y wget gnupg apt-transport-https

#Add the elastic repo
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list
apt-get update

#Elasticsearch
apt-get install elasticsearch -y
systemctl start elasticsearch && systemctl enable elasticsearch

#Kibana
apt-get install kibana -y
systemctl start kibana && systemctl enable kibana

#Logstash
apt-get install logstash -y
systemctl start logstash && systemctl enable logstash

