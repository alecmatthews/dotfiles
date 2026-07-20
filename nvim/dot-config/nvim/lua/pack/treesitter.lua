-- Setup treesitter for highlighing and actions

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter.git' })

local ts = require('nvim-treesitter')

ts.setup({
	install_dir = vim.fn.stdpath('data') .. '/site'
})

ts.install({ 'rust', 'lua', 'c', 'cpp', 'markdown', 'cmake' })

vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then return end

		if not pcall(vim.treesitter.language.add, lang) then return end

		pcall(vim.treesitter.start, buf, lang)
	end
})
