# set up PATH

# for run-tests.sh script
export GIT_EDITOR=/usr/bin/vim
export TMP="/tmp"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# INTERACTIVE STUFF FOLLOWS

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# see man ls for color info
export LSCOLORS="hxfxcxdxBxegedabagacad"

# load aliases
if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi

# load colors
if [ -f ~/.bash_prompt.sh ]
then
    source ~/.bash_prompt.sh
fi

# load work-specific stuff
if [ -f ~/.bash_work.sh ]
then
    source ~/.bash_work.sh
fi

# Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


printf "\e[0;36m%s\e[0m\n" "`fortune`"
