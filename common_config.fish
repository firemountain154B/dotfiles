#!/usr/bin/env fish

source {$HOME}/dotfiles/common_aliases
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

contains {$HOME}/dotfiles $fish_user_paths; or set -Ua fish_user_paths {$HOME}/dotfiles
contains {$HOME}/dotfiles/bin $fish_user_paths; or set -Ua fish_user_paths {$HOME}/dotfiles/bin

set CHECK_OUTPUT "$HOME/.check_update_output.txt"
[ -e $CHECK_OUTPUT ] || touch $CHECK_OUTPUT
cat $CHECK_OUTPUT
cat /dev/null > $CHECK_OUTPUT
check_update "$HOME/dotfiles" --bg "$CHECK_OUTPUT"
background "sync_dotfiles d" $CHECK_OUTPUT

