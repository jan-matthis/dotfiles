# dotfiles

Managed in a [bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).


## Installation

```commandtext
git clone --bare git@github.com:jan-matthis/dotfiles.git $HOME/.cfg
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
cfg checkout

# Checkout can fail if files exist, move offending files to backup folder
mkdir -p .config-backup
cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} dirname {} | awk {'print $1'} | xargs -I{} mkdir -p .config-backup/{}
cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

cfg checkout
cfg cfg --local status.showUntrackedFiles no
```

## Usage

Use `cfg` as a `git` alias to add and update dotfiles, e.g.:

```commandtext
cfg status
cfg add .vimrc
cfg commit -m "Update .vimrc"
cfg push
```
