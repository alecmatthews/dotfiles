vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('mini.completion').get_lsp_capabilities())
vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.enable({ "lua_ls" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format local buffer' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
