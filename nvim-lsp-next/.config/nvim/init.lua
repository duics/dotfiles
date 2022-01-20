require('config.packages')
require('config.basics')
require('config.keybindings')
require('config.treesitter')
require('config.rooter')
require('config.lualine')
require('config.lsp')
require('config.dap')
require('config.indent_blankline')
require('config.coq')

-- Initializers
require('gitsigns').setup({})
require('gitlinker').setup({ mappings = nil })
