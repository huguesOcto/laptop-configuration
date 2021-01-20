#!/bin/zsh

# zmodload zsh/zprof

# History
HISTSIZE=50000
SAVEHIST=10000
HISTFILE="$HOME/.local/share/zsh/history"

# Colors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# For autocomplete history
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Documentation des options : http://zsh.sourceforge.net/Doc/Release/Options.html
setopt auto_cd
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt prompt_subst
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data


# Autocomplétion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select


autoload -Uz compinit
zmodload -i zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files

# Load custom config
export CONFIG_DIR="$HOME/projects/laptop-configuration"
source "$CONFIG_DIR/prompt_theme.sh"
source "$CONFIG_DIR/functions.sh"

# Load aliases
local aliases_dir="$HOME/projects/laptop-configuration/aliases"
for file in $aliases_dir/*; do source $file; done

# Load tools
local tools_dir="$HOME/projects/laptop-configuration/tools"
source "$tools_dir/fzf.sh"
source "$tools_dir/z.sh"
source "$tools_dir/nvm.sh"
source "$tools_dir/zsh_auto_suggestion.sh"
source "$tools_dir/zsh_syntax_highlighting.sh"

# Load gitlab token
source "$CONFIG_DIR/.env"

# zprof
