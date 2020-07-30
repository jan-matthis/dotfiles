# Set a dummy terminal type if none set
# https://unix.stackexchange.com/a/517549
# ssh server -T "uname -a" lead to errors otherwise
[[ ! -t 1 ]] && export TERM=dumb        # Set a dummy terminal type unless a tty


# Functions
if [ -f ~/.functions ]; then
    source ~/.functions
fi


# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi


# History
shopt -s histappend  # Append to history file, don't overwrite it
HISTCONTROL=ignoreboth  # Don't duplicate lines, or lines starting with space
HISTFILESIZE=1000000000
HISTSIZE=1000000


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Miniconda
if [ ! -z "$MINICONDA" ]; then
    . $MINICONDA/etc/profile.d/conda.sh
fi

# Anaconda
__conda_setup="$($ANACONDA'/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$ANACONDA/etc/profile.d/conda.sh" ]; then
        . "$ANACONDA/etc/profile.d/conda.sh"
    fi
fi
unset __conda_setup


# Prompt
if [ -f $HOME/.bash_prompt.bash ]; then
    source $HOME/.bash_prompt.bash
fi
