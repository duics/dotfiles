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

-- telescope.nvim

-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

vimp.nnoremap('<leader>fd', ':lua telescope_live_grep_in_path()<cr>')
vimp.nnoremap('<leader><space>', ':lua telescope_files_or_git_files()<cr>')
vimp.nnoremap('<leader>ff', telescope.find_files)
-- vimp.nnoremap('<leader>fg', telescope git_branches)
vimp.nnoremap('<leader>fb', telescope.buffers)
vimp.nnoremap('<leader>fl', telescope.lsp_document_symbols)
vimp.nnoremap('<leader>fs', telescope.grep_string)
vimp.nnoremap('<leader>fr', telescope.live_grep)

-- vimp.nnoremap('<leader>fd', ':lua telescope_live_grep_in_path()<cr>')
-- vimp.nnoremap('<leader><space>', ':lua telescope_files_or_git_files()<cr>')
-- vimp.nnoremap('<leader>fd', ':lua telescope_find_files_in_path()<cr>')
-- vimp.nnoremap('<leader>ft', ':lua telescope_find_files_in_path("./tests")<cr>')
-- vimp.nnoremap('<leader>ft', ':lua telescope_live_grep_in_path("./tests")<cr>')
-- vimp.nnoremap('<leader>ff', ':telescope live_grep<cr>')
-- vimp.nnoremap('<leader>fo', ':telescope file_browser<cr>')
-- vimp.nnoremap('<leader>fn', ':telescope find_files<cr>')
-- vimp.nnoremap('<leader>fg', ':telescope git_branches<cr>')
-- vimp.nnoremap('<leader>fb', ':telescope buffers<cr>')
-- vimp.nnoremap('<leader>fs', ':telescope lsp_document_symbols<cr>')
-- vimp.nnoremap('<leader>ff', ':telescope grep_string<cr>')
