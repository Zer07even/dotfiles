#!/bin/bash

# Copy dotfiles
cp -r .config ${HOME}
cp .bashrc ${HOME}
cp .bash_aliases ${HOME}
cp .bash_profile ${HOME}

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install software-properties-common
install git
# install exfat-utils
# install openvpn

# Run all scripts in programs/
for f in scripts/programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

# Get Ansible Playbook
cd ..
git clone --depth 1 https://github.com/Zer07even/ansible-laptop
cd ansible-laptop
echo "run 'ansible-galaxy install -r requirements.yml && ansible-playbook playbook.yml -K' to install software"
