
local fzf = require('fzf-lua')

-- fzf and grep
vim.keymap.set("n", "<leader>f", function() fzf.files() end) --search cwd
vim.keymap.set("n", "<leader>Fc", function() fzf.files({ cwd = vim.fn.stdpath('config') }) end) --search neovim config
vim.keymap.set("n", "<leader>Ff", function() fzf.files({ cwd = '..' }) end) -- search above

