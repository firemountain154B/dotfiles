#!/bin/bash

current_shell=$(ps -p $$ -ocomm=)


# Define aliases based on color support
ncolors=$(tput colors)
if [ -n "$ncolors" ] && [ $ncolors -ge 8 ]; then
# Common aliases for both Bash and Zsh
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# Git with color output
alias git='git -c color.ui=auto'

# Colorized JSON output (requires jq)
alias json='jq .'

alias ls='ls --color=auto'
alias dir='dir --color=auto'

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

# continue wget
alias wget='wget -c'

alias df='df -H'
alias du='du -ch'

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="sudo lsof -i -P | grep -i 'python'"
alias ghist="history | grep"

export PATH="$HOME/bin:$PATH"

CHECK_OUTPUT="$HOME/.check_update_output.txt"

[ -e $CHECK_OUTPUT ] || touch $CHECK_OUTPUT

cat $CHECK_OUTPUT
echo '' >  $CHECK_OUTPUT

check_update "$HOME/bin" --bg "$CHECK_OUTPUT"
check_update "$HOME/dotfiles" --bg "$CHECK_OUTPUT"
background "sync_dotfiles d" /dev/null

##################################################
# bash specific
if [ $current_shell = "bash" ] ; then
  git_branch() {
    branch=$(git branch 2>/dev/null | grep '*' | sed 's/* //')
    if [ -n "$branch" ]; then
      echo " ($branch)"
    fi
  }

  PS1='$(if [ $? -ne 0 ]; then echo -e "\[\033[31m\]? "; fi)\[\033[32m\]\t \[\033[1;34m\]\W\[\033[0m\]$(git_branch)\$ '
fi

##################################################
# mac specific
if [ $(uname) = "Darwin" ] ; then
  export CLICOLOR=1
  export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
fi


##################################################
# bash specific
if [ $current_shell = "-zsh" ] ; then
PROMPT='%(?..%F{red}?%? )%F{green}%* %{$fg_bold[blue]%}%1~%{$reset_color%} $(git_prompt_info)'
fi


