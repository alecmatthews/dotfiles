#!/usr/bin/env zsh

zmodload zsh/complist

# keybindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'i' vi-insert
bindkey -M menuselect '/' history-incremental-search-forward


autoload -U compinit; compinit -d "$XDG_CACHE_HOME/.zcompdump"
_comp_options+=(globdots)  # complete hidden files


# options
setopt MENU_COMPLETE     # highlight first element in menu
setopt AUTO_LIST         # list choices on ambiguous completion
setopt COMPLETE_IN_WORD  # complete from both ends of the word
setopt ALWAYS_TO_END     # always move the cursor to the end of the completed word

unsetopt BEEP            # stop the dreadful beep **always**
unsetopt LIST_BEEP       # stop the dreadful beep

# allow user to expand aliases
zle -C expand-alias complete-word _generic
bindkey '^a' expand-alias
zstyle ':completion:expand-alias:*' completer _expand_alias

# define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# use result cache
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcomp-cache"

# use menu to complete
zstyle ':completion:*' menu select

zstyle ':completion:*' group-name ''  # Group results
zstyle ':completion:*' squeeze-slashes true  # reduce number of slash

# see ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# completion menu colors
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

if (( ! ${+CLICOLOR} )); then
  # This means we're not on a BSD system so try to make the colors the same as ls
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

