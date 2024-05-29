#!/usr/bin/env zsh

zmodload zsh/complist

# keybindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char


autoload -U compinit; compinit
_comp_options+=(globdots)  # complete hidden files


# options
setopt MENU_COMPLETE     # highlight first element in menu
setopt AUTO_LIST         # list choices on ambiguous completion
setopt COMPLETE_IN_WORD  # complete from both ends of the word
setopt ALWAYS_TO_END     # always move the cursor to the end of the completed word

unsetopt BEEP            # stop the dreadful beep **always**
unsetopt LIST_BEEP       # stop the dreadful beep

zstyle ':completion:*' menu select
