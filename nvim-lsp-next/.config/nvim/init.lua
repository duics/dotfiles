require('config.basics')
require('config.packages')
require('config.keybindings')
require('config.treesitter')
require('config.rooter')
require('config.lualine')
require('config.lsp')
require('config.dap')
require('config.indent_blankline')

-- Initializers
require('gitsigns').setup({})
