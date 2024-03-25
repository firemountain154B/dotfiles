#!/bin/bash

export PATH="$HOME/bin:$PATH"

CHECK_OUTPUT="$HOME/.check_update_output.txt"

if [ -s $CHECK_OUTPUT ]; then
    cat $CHECK_OUTPUT
    echo '' >  $CHECK_OUTPUT
fi

check_update "$HOME/bin" --bg "$CHECK_OUTPUT"
check_update "$HOME/dotfiles" --bg "$CHECK_OUTPUT"
background "sync_dotfiles d" /dev/null

source ""$HOME/.common_aliases.sh"

