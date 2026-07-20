-- Some custom commands mostly for adding, updating, and listing packages

-- Add a plugin manually
vim.api.nvim_create_user_command('PackAdd', function(opts)
	vim.pack.add(opts.fargs)
end, { nargs = '+', desc = 'Add plugins (:PackAdd user/repo1 ...)' })

-- Remove/clean plugins
vim.api.nvim_create_user_command('PackDel', function(opts)
	vim.pack.del(opts.fargs)
end, { nargs = '+', desc = 'Delete plugins (:PackDel user/repo1 ...)' })

-- Get plugin info
vim.api.nvim_create_user_command('PackList', function(_)
	local plugins = vim.pack.get()
	for _, v in ipairs(plugins) do
		vim.notify(string.format('%s active? %s', v.spec.name, v.active), vim.log.levels.INFO)
	end
end, { nargs = 0, desc = 'Get installed plugins (:PackList)' })

-- clean inactive plugins from disk
vim.api.nvim_create_user_command('PackClean', function(_)
	local non_active = vim.iter(vim.pack.get())
		:filter(function(x) return not x.active end)
		:map(function(x) return x.spec.name end)
		:totable()

	if #non_active > 0 then
		vim.notify('Cleaning inactive plugins', vim.log.levels.INFO)
		vim.pack.del(non_active)
	end
end, { nargs = 0, desc = 'Clean inactive plugins (:PackClean } ' })

-- Update plugins 
vim.api.nvim_create_user_command('PackUpdate', function(opts)
	if opts.args:match('%S') then
		-- update specific plugins
		local plugins = vim.split(opts.args, '%s+', { trimempty = true })
		vim.pack.update(plugins)
	else
		-- update all
		vim.pack.update()
	end
end, { nargs = '*', desc = 'Update all plugins or specific ones' })
