#!/bin/zsh

# cf https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ Clean-up:
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
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
export DELTA_PAGER="less -R"

# Set up language
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
  export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi
