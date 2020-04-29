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
