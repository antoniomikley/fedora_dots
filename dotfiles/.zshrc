# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2500
SAVEHIST=2500
setopt nomatch
unsetopt beep
bindkey -v

alias ls="ls -1 --color=auto"
alias sd="shutdown now"
alias er="~/fedora_dots/scripts/zellij-sessionizer.sh"
alias vpn="~/fedora_dots/scripts/vpn-switcher.sh"
alias ssh="TERM=xterm ssh"
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/antonio/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
eval "$(starship init zsh)"

