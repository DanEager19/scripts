#!/bin/bash

#Check for root access
if [[ $EUID -ne 0 ]]; then
        echo "This script needs root access"
        exit 1
fi

#Ansible
apt-get install -y python3 python3-pip
python3 -m pip install --user ansible

#Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get -y install terraform

#GitLab
apt-get install -y curl openssh-server ca-certificates tzdata perl postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash
EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee