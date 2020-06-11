#!/bin/bash

# Aliases that remap existing commands
alias vim="vim -i NONE"
alias git='LANG=en_US.UTF-8 git' # otherwise it's in French
alias sed='gsed'
alias awk="gawk"
ls -G . &>/dev/null && alias ls='ls -G' # Works on mac but not on linux

# Source file
alias sz='source $ZDOTDIR/.zshrc'

# List directory contents
alias l='ls -lah'
alias ll='ls -lh'

# Moving in directories
alias -- -='cd -'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

