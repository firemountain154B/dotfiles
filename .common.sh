#!/bin/bash

current_shell=$(ps -p $$ -ocomm=)

# Function to check if the terminal supports color
check_color_support() {
    # Check if stdout is a terminal
    if [ -t 1 ]; then
        # Check for color support
        ncolors=$(tput colors)
        if [ -n "$ncolors" ] && [ $ncolors -ge 8 ]; then
            echo "yes"
        else
            echo "no"
        fi
    else
        echo "no"
    fi
}

# Define aliases based on color support
if [ "$(check_color_support)" = "yes" ]; then
    # Common aliases for both Bash and Zsh
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip -color=auto'

    # Git with color output
    alias git='git -c color.ui=auto'
    
    # Colorized JSON output (requires jq)
    alias json='jq .'

    if [ "$current_shell" = "zsh" ]; then
        # Zsh specific color options
        alias ls='ls -G'
        alias dir='dir -G'
    else
        # Bash specific color options
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
    fi

    # Syntax highlighting for various file types using bat (if installed)
    if command -v bat >/dev/null 2>&1; then
        alias cat='bat --theme=TwoDark'
        alias less='bat --theme=TwoDark --pager="less -R"'
    fi
fi

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

export PATH="$HOME/bin:$PATH"

CHECK_OUTPUT="$HOME/.check_update_output.txt"

if [ -s $CHECK_OUTPUT ]; then
    cat $CHECK_OUTPUT
    echo '' >  $CHECK_OUTPUT
fi

check_update "$HOME/bin" --bg "$CHECK_OUTPUT"
check_update "$HOME/dotfiles" --bg "$CHECK_OUTPUT"
background "sync_dotfiles d" /dev/null

