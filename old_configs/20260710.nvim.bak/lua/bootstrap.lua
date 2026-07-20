
-- Bootstrap mini

local function bootstrap_mini()
	local path_package = vim.fn.stdpath('data') .. '/site'
	local mini_path = path_package .. '/pack/deps/start/mini.nvim'

	-- if mini is not found at `mini_path` install it
	if not vim.loop.fs_stat(mini_path) then
	  vim.cmd('echo "Installing `mini.nvim`" | redraw')
	  local clone_cmd = {
	    'git', 'clone', '--filter=blob:none',
	    -- Uncomment next line to use 'stable' branch
	    -- '--branch', 'stable',
	    'https://github.com/nvim-mini/mini.nvim', mini_path
	  }
	  vim.fn.system(clone_cmd)

	  -- add mini as a package to use and generate help
	  vim.cmd('packadd mini.nvim | helptags ALL')
	  vim.cmd('echo "Installed `mini.nvim`" | redraw')
	end
end

return {
	bootstrap_mini = bootstrap_mini,

}
