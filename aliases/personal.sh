#!/bin/bash

# Aliases that remap existing commands
alias vim="vim -i NONE"
alias git='LANG=en_US.UTF-8 git' # otherwise it's in French
ls -G . &>/dev/null && alias ls='ls -G' # Works on mac but not on linux

# Source file
alias sz='source $ZDOTDIR/.zshrc'

# List directory contents
alias l='ls -lah'
alias ll='ls -lh'
alias d='dirs -v | head -10'

# Moving in directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

