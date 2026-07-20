-- My editor options

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.isfname:append("@-@")

vim.opt.winborder = "rounded"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.completeopt = 'menuone,noselect,fuzzy,nosort'
vim.opt.shortmess:append('c')

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	callback = function()
		vim.hl.on_yank()
	end,
})

