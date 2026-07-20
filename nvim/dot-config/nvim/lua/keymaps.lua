-- Some keymaps

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>re', ':restart<CR>')

vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'moves lines down in visual selection' })
vim.keymap.set('v', 'K', ":move '>-2<CR>gv=gv", { desc = 'moves lines up in visual selection' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'next search result cursor centered' } )
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'next search result cursor centered' } )

vim.keymap.set('n', '<leader>u', function()
	vim.cmd.packadd('nvim.undotree')
	require('undotree').open()
end, { desc = 'Toggle builtin undotree' })
