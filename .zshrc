#!/bin/zsh

# zmodload zsh/zprof

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
zstyle ':completion:*' use-cache on # utilise le cache pour les opérations longues
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME}/.zsh_cache"

autoload -U compinit
zmodload -i zsh/complist
compinit -i -C -d "${ZSH_COMPDUMP}"
_comp_options+=(globdots)  # Include hidden files


###############################################################################
export CONFIG_DIR="$HOME/projects/laptop-configuration"
source "$CONFIG_DIR/aliases.sh"
source "$CONFIG_DIR/git_aliases_and_functions.sh"
source "$CONFIG_DIR/prompt_theme.sh"
source "$CONFIG_DIR/cool_oh_my_zsh_functions.sh"


################################################################################
local tools_dir="$HOME/projects/laptop-configuration/tools"
source "$tools_dir/fzf.sh"
source "$tools_dir/z.sh"
source "$tools_dir/nvm.sh"

# zsh auto-suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"
ZSH_AUTOSUGGEST_STRATEGY=(history)
# ZSH_AUTOSUGGEST_STRATEGY=(history completion) # -> too slow
################################################################################

################################################################################

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zprof
