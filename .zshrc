# zmodload zsh/zprof
export ZSH=/Users/hugues.tavenard/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export CONFIG_DIR=~/projects/laptop-configuration

source "$CONFIG_DIR/aliases"


# fzf command tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z command
source /usr/local/etc/profile.d/z.sh

# setup nvm
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$NVM_DIR/nvm.sh" ] && [ ! "$(type __init_nvm)" = function ]; then
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    echo "Lazy loading nvm..."
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi


# zprof



