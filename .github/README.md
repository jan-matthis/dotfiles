# dotfiles

Managed in a [bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).


## Installation

```commandline
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jan-matthis/dotfiles/HEAD/.install-dotfiles.sh)"
```

## Usage

Use `cfg` as a `git` alias to add and update dotfiles, e.g.:

```commandline
$ cfg status
$ cfg add .vimrc
$ cfg commit -m "Update .vimrc"
$ cfg push
```
