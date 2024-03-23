#!/bin/bash

. $HOME/.color_aliases.sh
# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# List directory contents
alias la='ls -a'
alias ll='ls -lh'
alias l='ls -lAh'

# Print path
alias path='echo $PATH'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="sudo lsof -i -P | grep -i 'python'"
alias ghist="history | grep"

