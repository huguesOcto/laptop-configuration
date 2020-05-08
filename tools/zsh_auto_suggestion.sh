#!/bin/bash

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
ZSH_AUTOSUGGEST_STRATEGY=(history)
# ZSH_AUTOSUGGEST_STRATEGY=(history completion) # -> too slow
