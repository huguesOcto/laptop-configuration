#!/bin/bash

# functions
function current_branch() {
  git_current_branch
}

# status
alias gst='git status'

# commit/add
alias ga='git add'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcam='git commit -a -m'
alias gcm='git commit -m'

# diff
alias gd='git diff'

# checkout
alias gcb='git checkout -b'
alias gct="git branch -r | fzf -i --height 50% | xargs git checkout -t"

function gco() {
    if [ -z "$1" ]
    then
        git branch | fzf -i --height 50% | xargs git checkout
    else
        git checkout $1
    fi
}

# disable homebrew git completion : /usr/local/share/zsh/site-functions/_git
compdef _git gco=git-checkout


# fetch
alias gf='git fetch'

# log
alias gls="git --no-pager log --decorate --abbrev-commit --pretty=oneline -n 20"
alias gll="git --no-pager log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit HEAD ^origin/master"

# set-upstream
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'

# rebase
# todo : en faire une fonction qui rebase uniquement l'upstream quand
# aucun argument est donné
alias gup='git pull --rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# push/pull/reset
alias ggp='git push origin $(git_current_branch)'
alias ggp-f="git push --force-with-lease origin HEAD"
alias ggl='git pull origin $(git_current_branch)'
alias g-reset-f="git reset --hard @{upstream}"

# never used
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'


## WORK IN PROGRESS
# get rebase needed status
# local behind_develop=$(command git rev-list HEAD..origin/develop 2>/dev/null | wc -l)


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

# function gcam-skip() {
#     git commit -a -m "[skip-ci] ${1}"
# }

# ggl() {
#   if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
#     git pull origin "${*}"
#   else
#     [[ "$#" == 0 ]] && local b="$(git_current_branch)"
#     git pull origin "${b:=$1}"
#   fi
# }
# compdef _git ggl=git-checkout

# ggp() {
#   if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
#     git push origin "${*}"
#   else
#     [[ "$#" == 0 ]] && local b="$(git_current_branch)"
#     git push origin "${b:=$1}"
#   fi
# }
# compdef _git ggp=git-checkout
