#!/usr/bin/env sh

read -s -p "Enter user password:" userPass
echo ""
echo "--- Installing stow and ansible ---"
dnf install -y stow ansible
echo "--- Setting up with ansible ---"
ansible-playbook ./system_configure.yml -e "ansible_become_password=$userPass"



