#!/bin/bash

function git_prompt_info() {
    local ref
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$GIT_PROMPT_SUFFIX"
}

function parse_git_dirty() {
    local STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
    [ -n "$STATUS" ] && echo "$GIT_PROMPT_DIRTY" || echo "$GIT_PROMPT_CLEAN"
}

# Apply theming defaults
PS1="%n@%m:%~%# "

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
GIT_PROMPT_SUFFIX="%{$reset_color%} "
GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
GIT_PROMPT_CLEAN="%{$fg[blue]%})"
