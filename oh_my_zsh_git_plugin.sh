# Query/use custom command for `git`.
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}


function current_branch() {
  git_current_branch
}


alias ga='git add'
alias gcan!='git commit -v -a --no-edit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcam='git commit -a -m'
alias gd='git diff'

alias gcmsg='git commit -m'

alias gb='git branch'

alias gf='git fetch'


ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
compdef _git ggl=git-checkout

ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git ggp=git-checkout





alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'



alias grba='git rebase --abort'
alias grbc='git rebase --continue'


alias gst='git status'

alias gup='git pull --rebase'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'

# comprendre ceux là
alias groh='git reset origin/$(git_current_branch) --hard'
compdef _git gpoat=git-push