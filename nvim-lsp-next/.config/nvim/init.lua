require('config.packages')
require('config.basics')
require('config.keybindings')
require('config.treesitter')
require('config.rooter')
require('config.lualine')
require('config.lsp')
require('config.dap')
require('config.indent_blankline')

-- Initializers
require('gitsigns').setup({})
require('gitlinker').setup({ mappings = nil })
require('fidget').setup{}
vim.notify = require("notify")
vim.cmd([[ let g:ultest_use_pty = 1 ]])

