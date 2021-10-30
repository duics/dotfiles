local vimp = require('vimp')
local telescope = require('telescope.builtin')

-- nvim

vim.g.mapleader = ' '

-- reload configs

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
