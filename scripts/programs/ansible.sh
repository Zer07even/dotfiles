#!/bin/bash

echo "⌨️  Installing Ansible"
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible