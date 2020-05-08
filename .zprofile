#!/bin/zsh

# cf https://wiki.archlinux.org/index.php/XDG_Base_Directory
# .config stands for XDG_CONFIG_HOME
# .local/share stands for XDG_DATA_HOME
# .cache stands for XDG_CACHE_HOME

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# History
HISTSIZE=50000
SAVEHIST=10000
HISTFILE="$HOME/.local/share/zsh/history"

# ~/ Clean-up:
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${ZSH_VERSION}"
export _Z_DATA="$XDG_DATA_HOME/z/z"
export LESSHISTFILE="-" # no less history file
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node/node_repl_history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite/sqlite_history"
# export NVM_DIR="$HOME/.local/share/nvm" -> thid did not work
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Other program settings
export LESS=-R
export PAGER=less

# Set up language
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
  export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi
