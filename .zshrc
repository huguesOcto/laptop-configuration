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

# alias git
alias ggp-f="git push --force-with-lease origin HEAD"
alias g-reset-f="git reset --hard @{upstream}"
alias gls="git --no-pager log --decorate --abbrev-commit --pretty=oneline -n 5"
alias gll="git --no-pager log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit HEAD ^origin/develop"

# aliases for ERPC
alias docker-up="docker-compose -f dev/docker-compose.dev.yml up"
alias docker-down="docker-compose -f dev/docker-compose.dev.yml down"
alias run-docker-compose="docker-down && docker-up --build"

alias fake-smtp="java -jar ~/Desktop/creno_dispo/fakeSMTP-2.0.jar  -o ~/Desktop/creno_dispo/smtp_output"

# Gatling aliases for ERPC
alias gatling-editeur-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatEditeurSimulation"
alias gatling-front-prise-sous-mandat="gradle clean gatlingRun-fr.gouv.interieur.formation.priseSousMandat.PriseSousMandatFrontSimulation"


alias build-batch-reprise="docker build -t batch-reprise ~/projects/creno-dispo/batch_reprise"
alias run-batch-reprise="build-batch-reprise && \
            docker run --rm --network=dev_default \
            --env-file ~/projects/creno-dispo/batch_reprise/env/datasource.env \
            batch-reprise \
            default"
# alias run-batch-reprise="docker-compose \
#     -f ~/projects/creno-dispo/dev/docker-compose.dev.data.yml up --build"


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

# For oracle CLI
# export PATH=/Users/hugues.tavenard/bin:$PATH
# [[ -e "/Users/hugues.tavenard/lib/oracle-cli/lib/python3.5/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/Users/hugues.tavenard/lib/oracle-cli/lib/python3.5/site-packages/oci_cli/bin/oci_autocomplete.sh"

# custom git functions
# function ticket_number() {
#     echo $(git_current_branch) | grep -o '^[0-9]\+'
# }

# function commit_message() {
#     echo "${1}"\($(ticket_number)\)": ${2}"
# }

# function gcamf() {
#     git commit -a -m "$(commit_message feat ${1})"
# }

# function gcamr() {
#     git commit -a -m "$(commit_message refactor ${1})"
# }

# function gcam-fix() {
#     git commit -a -m "$(commit_message fix ${1})"
# }

# function gcam-chore() {
#     git commit -a -m "$(commit_message chore ${1})"
# }

# function gcam-test() {
#     git commit -a -m "$(commit_message test ${1})"
# }


# function read() {
#     less ~/projects/creno-dispo/"${1}"
# }

# function gcam-skip() {
#     git commit -a -m "[skip-ci] ${1}"
# }

# zprof



