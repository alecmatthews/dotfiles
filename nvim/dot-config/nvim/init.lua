-- A minimal neovim config

-- experimental! Replaces handling for the message 
-- and command line buffers
require("vim._core.ui2").enable({})

require('options')
require('keymaps')
require('commands')
require('pack')

