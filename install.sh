#!/bin/bash

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

# Install GIT
install git

# Clone full repo to continue 
git clone --depth 1 https://github.com/Zer07even/dotfiles
cd dotfiles

# Copy dotfiles
cp -r .config ${HOME}
cp .bashrc ${HOME}
cp .bash_aliases ${HOME}
cp .bash_profile ${HOME}
cp .pam_environment ${HOME}

# Prep Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install Ansible
install software-properties-common
install ansible

# Install other scripts in programs/
for f in scripts/programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

# Get Ansible Playbook
cd ..
git clone --depth 1 https://github.com/Zer07even/ansible-laptop
cd ansible-laptop
echo " "
echo " "
echo "run 'cd ../ansible-laptop && ansible-galaxy install -r requirements.yml && ansible-playbook playbook.yml -K' to install software"
