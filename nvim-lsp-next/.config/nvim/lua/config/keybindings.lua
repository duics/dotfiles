local vimp = require('vimp')
local telescope = require('telescope.builtin')

-- nvim

vim.g.mapleader = ' '

-- configs

vimp.nnoremap('<leader>ec', ':vsp $MYVIMRC<CR>')

vimp.nnoremap('<leader>r', function()
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('config.X') is called
  -- it will reload the file
  require("config.utils").unload_lua_namespace('config')
  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  dofile(vim.fn.stdpath('config') .. '/init.lua')

  print("Reloaded vimrc!")
end)

-- Search

vimp.nnoremap('<leader>sc', ':nohl<CR>')
vimp.nnoremap('<leader><leader>', ':nohl<CR>')
vimp.nnoremap('<leader>sr', ':%s/')

-- telescope.nvim

vimp.nnoremap('<leader>ff', telescope.find_files)
vimp.nnoremap('<leader>fg', telescope.git_files)
vimp.nnoremap('<C-p>', telescope.git_files)
vimp.nnoremap('<leader>sb', telescope.buffers)
-- vimp.nnoremap('<leader>fs', telescope.grep_string)
vimp.nnoremap('<leader>ss', telescope.live_grep)

vimp.nnoremap('<leader>sgb', telescope.git_branches)
vimp.nnoremap('<leader>sgc', telescope.git_commits)

vimp.nnoremap('<leader>sl', telescope.lsp_document_symbols)

vimp.nnoremap('<leader>sx', telescope.commands)

vimp.nnoremap('<leader>fb', telescope.file_browser)

-- nvim-tree

vimp.nnoremap('<leader>ft', ':NvimTreeToggle<CR>')
vimp.nnoremap('<leader>op', ':NvimTreeToggle<CR>')

-- Neogit

local neogit = require('neogit')

vimp.nnoremap('<leader>gs', neogit.open)

-- LSP

vimp.nnoremap('<leader>cD', vim.lsp.buf.declaration)
vimp.nnoremap('<leader>cd', vim.lsp.buf.definition)
vimp.nnoremap('<leader>ck', vim.lsp.buf.hover)
vimp.nnoremap('<leader>ci', vim.lsp.buf.implementation)
vimp.nnoremap('<leader>ch', vim.lsp.buf.signature_help)
vimp.nnoremap('<leader>lwa', vim.lsp.buf.add_workspace_folder)
vimp.nnoremap('<leader>lwr', vim.lsp.buf.remove_workspace_folder)
vimp.nnoremap('<leader>lwl', vim.lsp.buf.list_workspace_folders)
vimp.nnoremap('<leader>ct', vim.lsp.buf.type_definition)
vimp.nnoremap('<leader>cr', vim.lsp.buf.rename)
vimp.nnoremap('<leader>ca', vim.lsp.buf.code_action)
vimp.nnoremap('<leader>cR', vim.lsp.buf.references)
vimp.nnoremap('<leader>ce', vim.lsp.diagnostic.show_line_diagnostics)
vimp.nnoremap('<leader>ep', vim.lsp.diagnostic.goto_prev)
vimp.nnoremap('<leader>en', vim.lsp.diagnostic.goto_next)
vimp.nnoremap('<leader>lq', vim.lsp.diagnostic.set_loclist)
vimp.nnoremap('<leader>cf', vim.lsp.buf.formatting)
