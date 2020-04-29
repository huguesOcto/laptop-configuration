# Query/use custom command for `git`.
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}

# functions
function current_branch() {
  git_current_branch
}

# commit/add
alias ga='git add'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcam='git commit -a -m'
alias gcmsg='git commit -m'

# diff
alias gd='git diff'

# checkout
alias gco='git checkout'
alias gcb='git checkout -b'

# fetch
alias gf='git fetch'

# log
alias gls="git --no-pager log --decorate --abbrev-commit --pretty=oneline -n 5"
alias gll="git --no-pager log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit HEAD ^origin/develop"

# set-upstream
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'

# rebase
alias gup='git pull --rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# status
alias gst='git status'

# never used
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'

# push/pull/reset
alias ggp-f="git push --force-with-lease origin HEAD"
alias g-reset-f="git reset --hard @{upstream}"
alias ggl='git pull origin $(git_current_branch)'
alias ggp='git push origin $(git_current_branch)'

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
