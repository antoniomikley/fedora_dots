#!/bin/sh

cache_file=~/.cache/vpn-switcher
running_vpn=$(systemctl --type=service --state=running | grep 'openvpn' | cut -d. -f1)
vpn_list=$(systemctl list-unit-files | grep 'openvpn' | grep -v 'restart')
if [[ ! -z $running_vpn ]]; then
    vpn_list=$(printf "$vpn_list" | grep -v "$running_vpn")
fi
printf "$vpn_list" | cut -d. -f1 > $cache_file
selected=$(cat $cache_file | fzf)
if [[ ! -z $selected ]]; then
    if [[ ! -z $running_vpn ]]; then
        sudo systemctl stop $running_vpn
    fi
    sudo systemctl start $selected
fi
rm $cache_file
