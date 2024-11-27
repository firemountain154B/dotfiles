#!/usr/bin/env fish

source {$HOME}/dotfiles/common_aliases
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export MAKE='make -j9'

contains {$HOME}/dotfiles $fish_user_paths; or set -Ua fish_user_paths {$HOME}/dotfiles
contains {$HOME}/dotfiles/bin $fish_user_paths; or set -Ua fish_user_paths {$HOME}/dotfiles/bin

if status --is-login
  on_login
end

