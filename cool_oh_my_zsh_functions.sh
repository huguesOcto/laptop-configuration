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
  echo $(fc -ln | tail -n1) | tr -d '\n' | pbcopy && echo "Commande copiée 👌"
}

function m() {
  local lien_daily='https://meet.google.com/cgj-uzcb-ghc'
  local lien_perso='https://meet.google.com/jbt-nusx-bjm'
  local lien=""

  case $1 in
     "daily") lien="$lien_daily";;
     *) lien="$lien_perso";;
  esac

  echo "$lien" | pbcopy
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
