#!/usr/bin/env zsh

# directory stack
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# neovim
alias vim='nvim'
alias vimro='nvim -R'
alias vi='nvim'


