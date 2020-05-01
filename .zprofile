#!/bin/zsh

# cf https://wiki.archlinux.org/index.php/XDG_Base_Directory
# .config stands for XDG_CONFIG_HOME
# .local/share stands for XDG_DATA_HOME
# .cache stands for XDG_CACHE_HOME

# History
HISTSIZE=50000
SAVEHIST=10000
HISTFILE="$HOME/.local/share/zsh/history"

# ~/ Clean-up:
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump-${ZSH_VERSION}"
export _Z_DATA="$HOME/.local/share/z/z"
export LESSHISTFILE="-" # no less history file
export DOCKER_CONFIG="$HOME/.config/docker"
export NODE_REPL_HISTORY=".local/share/node/node_repl_history"
export SQLITE_HISTORY="$HOME/.local/share/sqlite/sqlite_history"
# export NVM_DIR="$HOME/.local/share/nvm" -> thid did not work
export GRADLE_USER_HOME="$HOME"/.local/share/gradle
