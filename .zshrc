# zmodload zsh/zprof
export ZSH=/Users/hugues.tavenard/.oh-my-zsh
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(
  git
  # kubectl
)

source $ZSH/oh-my-zsh.sh

export CONFIG_DIR=~/projects/laptop-configuration

source "$CONFIG_DIR/aliases"

# Source bash_profile
# source ~/.bash_profile

# pyenv
# export PATH="/usr/local/opt/openssl/bin:$PATH"
# eval "$(pyenv init -)"

# Add RVM to PATH
# export PATH="$PATH:$HOME/.rvm/bin"

# fzf command tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojump command
# [ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh

# z command
source /usr/local/etc/profile.d/z.sh

##################################
##################################
# nvm stuff
# Solution 1
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Solution 2
# export NVM_DIR="$HOME/.nvm"
# nvm() {
#     echo "Lazy loading nvm..."
#     # Remove nvm function
#     unfunction "$0"
#     # Load nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
#     # Load bash_completion
#     [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
#     # Call nvm
#     $0 "$@"
# }

# Solution 3
# export NVM_DIR="$HOME/.nvm"
#  nvm_load () {
#    . $NVM_DIR/nvm.sh
#    . $NVM_DIR/bash_completion
#  }
#  alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
#  alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'
#  alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'

# Solution 4
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
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
##################################
##################################


# zprof



