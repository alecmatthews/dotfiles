-- config for mini.nvim

vim.pack.add({
	'https://github.com/nvim-mini/mini.nvim.git'
})

require('mini.pick').setup()
vim.keymap.set('n', '<leader>f', MiniPick.builtin.files, { desc = 'Mini file picker' })
vim.keymap.set('n', '<leader>h', MiniPick.builtin.help, { desc = 'Mini help search' })
vim.keymap.set('n', '<leader>b', MiniPick.builtin.buffers, { desc = 'Mini buffer search' })
vim.keymap.set('n', '<leader>s', function()
	MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>') })
end, { desc = 'Mini buffer search' })

require('mini.files').setup()
vim.keymap.set('n', '-', function()
	if not MiniFiles.close() then MiniFiles.open() end
end, { desc = 'Toggle mini files explorer' })

vim.keymap.set('n', '<leader>-', function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	MiniFiles.reveal_cwd()
end, { desc = "Open mini files to current file's parent dir" })

require('mini.cmdline').setup({
	autocomplete = { delay = 500 },
	autocorrect = { enabled = false }
})

require('mini.surround').setup()
require('mini.statusline').setup()
require('mini.notify').setup()
require('mini.git').setup()
require('mini.diff').setup()

require('mini.extra').setup()
vim.keymap.set('n', '<leader>sk', MiniExtra.pickers.keymaps, { desc = 'Search keymaps' })
vim.keymap.set('n', '<leader>xx', MiniExtra.pickers.diagnostic, { desc = 'Mini picker with diagonstics' })

require('mini.completion').setup({
	lsp_completion = { auto_setup = true }
})

