#!/usr/bin/env sh

read -s -p "Enter ansible_become_password:" userPass
echo ""
echo "--- Installing stow and ansible ---"
sudo dnf install -y stow ansible
echo "--- Setting up with ansible ---"
ansible-playbook setup_system.yml -e "ansible_become_password=$userPass"



