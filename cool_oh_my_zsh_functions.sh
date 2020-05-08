#!/bin/bash

function _compute_stats() {
  local separator=${1:-" "}
  local awk_command='
  {
    CMD[$0]++;
    count++;
  }
  END {
    for (a in CMD)
      print CMD[a] separator CMD[a]/count*100 "%" separator a;
  }'
  awk -v separator="$separator" $awk_command
}

function zsh_stats() {
  fc -ln 1 \
    | awk '{print $1;}' \
    | _compute_stats \
    | column -c3 -s " " -t \
    | sort -nr \
    | head -n20 \
    | nl
}


function zsh_stats_full_commands() {
  local complex_separator="[;;]"
  fc -ln 1 \
    | _compute_stats $complex_separator \
    | column -c3 -s $complex_separator -t \
    | sort -nr \
    | head -n50 \
    | nl
}

# put last command in clipboard
function c() {
  local last_command
  last_command=$(fc -ln | tail -n1)
  echo $last_command | tr -d '\n' | pbcopy
  echo "Commande \"$last_command\" copiée 👌"
}

# put my meet link in clipboard
function m() {
  local my_meet='https://meet.google.com/jbt-nusx-bjm'
  echo $my_meet | pbcopy
  echo "Lien du meet copié dans le presse papier 👌"
}


# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  local SHA
  SHA=$(command git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
  local SHA
  SHA=$(command git rev-parse HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}
