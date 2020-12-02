#!/bin/bash

set -o pipefail
shopt -s expand_aliases

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

if [ -d "$HOME/.cfg" ]
then
  cfg pull
  echo "Updated dotfiles"
else
  git clone --bare git@github.com:jan-matthis/dotfiles.git $HOME/.cfg
  mkdir -p .config-backup
  cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} dirname {} | awk {'print $1'} | xargs -I{} mkdir -p .config-backup/{}
  cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
  cfg checkout
  cfg config --local status.showUntrackedFiles no
  echo "Installed dotfiles"
fi
