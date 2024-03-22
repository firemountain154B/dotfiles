#!/bin/bash

. $HOME/.color_aliases.sh
# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cpv='rsync -ah --info=progress2'
alias cpz='rsync -ahz --info=progress2'

# List directory contents
alias la='ls -a'
alias ll='ls -lh'
alias l='ls -lAh'

# Print path
alias path='echo $PATH'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias rm="rm -i"
alias cp="cp -i"

# Show active network interfaces
alias ifactive="sudo lsof -i -P | grep -i 'python'"
alias ghist="history | grep"

alias G='| grep'
alias H='| head'
alias L='| less'
alias LL='2>&1 | less'
alias M='| most'
alias NE='2> /dev/null'
alias NUL='> /dev/null 2>&1'
alias P='2>&1| pygmentize -l pytb'
alias T='| tail'
alias cp='cp -i'

