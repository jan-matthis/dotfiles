#!/bin/bash

git clone --bare git@github.com:jan-matthis/dotfiles.git $HOME/.cfg
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Checkout can fail if files exist, move offending files to backup folder
mkdir -p .config-backup
cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} dirname {} | awk {'print $1'} | xargs -I{} mkdir -p .config-backup/{}
cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

cfg checkout
cfg config --local status.showUntrackedFiles no

echo "Successfully installed dotfiles"
