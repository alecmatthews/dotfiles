# My current neovim config

-- make sure mini is installed
-- mostly I'm using mini-deps to install plugins
require('bootstrap').bootstrap_mini()
require('mini.deps').setup()

-- set leader key
vim.g.mapleader = " "

local add = MiniDeps.add

add('ibhagwan/fzf-lua')

-- color scheme
add({ source = 'catppuccin/nvim', name = 'catppuccin' })
vim.cmd.colorscheme "catppuccin-mocha"

-- statusline
require('plugins.mini-statusline')

-- fzf; fuzzy finding
require('plugins.fzf-lua')
