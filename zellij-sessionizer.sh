#!/bin/sh

cache_file=~/.cache/zellij-sessionizer
if [ ! -f "$cache_file" ]; then
    touch "$cache_file"
fi
while true; do
    selected=$(cat $cache_file)
    echo "" > $cache_file

    if [ -z "$selected" ]; then
        selected=$(find ~/ -maxdepth 3 -path '*/.git' -print -prune 2>/dev/null | xargs -I {} dirname {} | fzf)
    fi
    if [ -z "$selected" ]; then
        exit 0
    fi
    session_name=$(basename $selected)

    if [ -z $ZELLIJ ]; then
        cd $selected
        zellij attach $session_name -c
        [ -z $(cat $cache_file) ] && break 
    else
        echo "$selected" > $cache_file
        kill $(pgrep -f "zellij attach $ZELLIJ_SESSION_NAME -c") &> /dev/null
        exit 0
    fi
done
exit 0
