#
# PATH
#

# ~/bin
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# ~/.local/bin
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Miniconda
if [ -d "$HOME/miniconda/bin" ] ; then
    export MINICONDA="$HOME/miniconda"
    export CONDA="$MINICONDA"
fi
if [ -d "$HOME/miniconda3/bin" ] ; then
    export MINICONDA="$HOME/miniconda3"
    export CONDA="$MINICONDA"
fi

# Anaconda
if [ -d "$HOME/anaconda/bin" ] ; then
    export ANACONDA="$HOME/anaconda"
    export CONDA="$ANACONDA"
    export PATH="$ANACONDA/bin:$PATH"
fi
if [ -d "$HOME/anaconda3/bin" ] ; then
    export ANACONDA="$HOME/anaconda3"
    export CONDA="$ANACONDA"
    export PATH="$ANACONDA/bin:$PATH"
fi
if [ -d "$HOME/opt/anaconda3/bin" ] ; then
    export ANACONDA="$HOME/opt/anaconda3"
    export CONDA="$ANACONDA"
    export PATH="$ANACONDA/bin:$PATH"
fi

# Julia on Unix
if [ -d "$HOME/julia/bin" ] ; then
    export PATH="$HOME/julia/bin:$PATH"
fi

# Inkscape on macOS
if [ -f "/Applications/Inkscape.app/Contents/MacOS/inkscape" ] ; then
    export PATH="/Applications/Inkscape.app/Contents/MacOS:$PATH"
fi

# NEURON on macOS
if [ -d "/Applications/NEURON-7.6" ] ; then
    export PATH="/Applications/NEURON-7.6/nrn/x86_64/bin":$PATH
    export PYTHONPATH="/Applications/NEURON-7.6/nrn/lib/python":$PYTHONPATH
fi


#
# Environment variables
#

# Locale
export LC_ALL=en_US.UTF-8
export LANG="en_US"

# Unix
export EDITOR=vim
export CLICOLOR=1  # Colorful ls

# Python
export PYTHONSTARTUP="$HOME/.pythonrc"
#export MPLBACKEND="agg"

# NVM
export NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/nvm.sh" ] ; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Ansible
export ANSIBLE_NOCOWS=1

# AWS
export AWS_REGION="us-east-1"
export AWS_DEFAULT_REGION=$AWS_REGION


#
# Additional variables
if [ -f "$HOME/.profile_extra" ] ; then
    . $HOME/.profile_extra
fi
# BEGIN ANSIBLE MANAGED BLOCK sbibm.sbibm_env
# sbibm
export JULIA_SYSIMAGE_DIFFEQTORCH="$HOME/.julia_sysimage_diffeqtorch.so"
# END ANSIBLE MANAGED BLOCK sbibm.sbibm_env
