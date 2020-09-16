# Functions
source $HOME/.functions


# Aliases
source $HOME/.aliases


# General settings
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt multios
setopt cdablevarS
setopt autocd
setopt extendedglob
setopt interactivecomments
setopt nobeep
setopt nocheckjobs
setopt correct


# Keybindings
set -o emacs
#set -o vi


# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt histignoredups
setopt share_history
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history


# Miniconda
if [ ! -z "$MINICONDA" ]; then
    . $MINICONDA/etc/profile.d/conda.sh
fi


# Anaconda
__conda_setup="$($ANACONDA'/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$ANACONDA/etc/profile.d/conda.sh" ]; then
        . "$ANACONDA/etc/profile.d/conda.sh"
    fi
fi
unset __conda_setup


#
# Plugins with zplug
#
# Usage:
# https://github.com/zplug/zplug#usage
#

if [ ! -f "$HOME/.zplug/init.zsh" ] &> /dev/null; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

if [ -d "$HOME/.zplug" ] ; then
    source ~/.zplug/init.zsh

    # fzf
    # https://github.com/junegunn/fzf-bin/releases
    # https://unix.stackexchange.com/a/531184
    case "$OSTYPE" in
      darwin*)
          zplug "junegunn/fzf-bin", \
              from:gh-r, \
              at:0.21.0, \
              as:command, \
              use:"*darwin*amd64*", \
              rename-to:fzf
          zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
      ;;
      linux*)
          zplug "junegunn/fzf-bin", \
              from:gh-r, \
              at:0.21.0, \
              as:command, \
              use:"*linux*amd64*", \
              rename-to:fzf
          zplug "junegunn/fzf", use:"shell/*.zsh", defer:2
      ;;
      dragonfly*|freebsd*|netbsd*|openbsd*)
        # ...
      ;;
    esac

    # Autoenv
    # https://github.com/Tarrasch/zsh-autoenv
    zplug "Tarrasch/zsh-autoenv"

    # Autojump
    # https://github.com/wting/autojump
    # https://github.com/wting/autojump/pull/476
    #zplug "wting/autojump", \
    #      use:"bin/autojump", \
    #      as:command, \
    #      hook-build:"termux-fix-shebang bin/*"
    #zplug "wting/autojump", \
    #      use:"bin/autojump.zsh"

    # Completions
    # Autosuggestions
    # Syntax highlighting
    # History substring search
    zplug "zsh-users/zsh-completions",              defer:0
    zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
    zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
    zplug "tmuxinator/tmuxinator",                  use:"completion/*.zsh"

    # Prompt (last plugin)
    # https://github.com/sindresorhus/pure
    zplug mafredri/zsh-async, from:github
    zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

    # zplug check returns true if all packages are installed
    # Therefore, when it returns false, run zplug install
    if ! zplug check; then
        zplug install
    fi

    # Finally: Source plugins and add commands to $PATH
    zplug load
fi


# Completions
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'


# Completions: Bash
autoload bashcompinit
bashcompinit


# Syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/573
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none


# TMUX
#if ! { [ -n "$TMUX" ]; } then
#    tmux -L C_b -f $HOME/.config/tmux/prefix_C-b.conf new -A -s outer
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
