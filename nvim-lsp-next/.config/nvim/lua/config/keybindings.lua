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

-- -- telescope.nvim

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

-- Git

local neogit = require('neogit')
local gitsigns = require('gitsigns')

vimp.nnoremap('<leader>gg', neogit.open)
vimp.nnoremap('<leader>gc', function () neogit.open({ 'commit' }) end)
vimp.nnoremap('<leader>gsh', gitsigns.stage_hunk)
vimp.nnoremap('<leader>guh', gitsigns.undo_stage_hunk)
vimp.vnoremap('<leader>gsh', function() gitsigns.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end)
vimp.vnoremap('<leader>guh', function() gitsigns.undo_stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end)


-- LSP

vimp.nnoremap('<leader>mD', telescope.lsp_references)
vimp.nnoremap('<leader>md', telescope.lsp_definitions)
vimp.nnoremap('<leader>ld', vim.lsp.buf.definition)
vimp.nnoremap('<leader>ck', vim.lsp.buf.hover)
vimp.nnoremap('<leader>ci', telescope.lsp_implementations)
vimp.nnoremap('<leader>ch', vim.lsp.buf.signature_help)
vimp.nnoremap('<leader>lwa', vim.lsp.buf.add_workspace_folder)
vimp.nnoremap('<leader>lwr', vim.lsp.buf.remove_workspace_folder)
vimp.nnoremap('<leader>lwl', vim.lsp.buf.list_workspace_folders)
vimp.nnoremap('<leader>ct', telescope.lsp_type_definitions)
vimp.nnoremap('<leader>lt', vim.lsp.buf.type_definition)
vimp.nnoremap('<leader>cR', vim.lsp.buf.rename)
vimp.nnoremap('<leader>ca', function() require("code_action_menu").open_code_action_menu() end)
vimp.nnoremap('<leader>cr', telescope.lsp_references)
vimp.nnoremap('<leader>ce', telescope.lsp_document_diagnostics)
vimp.nnoremap('<leader>cE', telescope.lsp_workspace_diagnostics)
vimp.nnoremap('<leader>ek', vim.lsp.diagnostic.goto_prev)
vimp.nnoremap('<leader>ej', vim.lsp.diagnostic.goto_next)
vimp.nnoremap('<leader>lq', vim.lsp.diagnostic.set_loclist)
vimp.nnoremap('<leader>cf', vim.lsp.buf.formatting)

vimp.nnoremap('<C-l>D', telescope.lsp_references)
vimp.nnoremap('<C-l>d', telescope.lsp_definitions)
vimp.nnoremap('K', vim.lsp.buf.hover)
vimp.nnoremap('<C-l>i', telescope.lsp_implementations)
vimp.nnoremap('<C-l>h', vim.lsp.buf.signature_help)
vimp.nnoremap('<C-l>wa', vim.lsp.buf.add_workspace_folder)
vimp.nnoremap('<C-l>wr', vim.lsp.buf.remove_workspace_folder)
vimp.nnoremap('<C-l>wl', vim.lsp.buf.list_workspace_folders)
vimp.nnoremap({'override'}, '<C-l>t', telescope.lsp_type_definition)
vimp.nnoremap('<C-l>r', vim.lsp.buf.rename)
vimp.nnoremap('<C-l>a', function() require("code_action_menu").open_code_action_menu() end)
vimp.nnoremap('<C-l>R', telescope.lsp_references)
vimp.nnoremap('<C-l>e', telescope.lsp_document_diagnostics)
vimp.nnoremap('<C-l>E', telescope.lsp_workspace_diagnostics)
vimp.nnoremap('<C-l>k', vim.lsp.diagnostic.goto_prev)
vimp.nnoremap('<C-l>j', vim.lsp.diagnostic.goto_next)
vimp.nnoremap('<C-l>q', vim.lsp.diagnostic.set_loclist)
vimp.nnoremap('<C-l>f', vim.lsp.buf.formatting)

-- Debug

local dap = require('dap')
local dapui = require('dapui')

vimp.nnoremap('<leader>dd', dapui.toggle)
vimp.nnoremap('<A-d>t', dapui.toggle)
vimp.nnoremap('<A-d>j', dap.continue)
vimp.nnoremap('<A-d>J', dap.step_over)
vimp.nnoremap('<A-d>l', dap.step_into)
vimp.nnoremap('<A-d>h', dap.step_out)
vimp.nnoremap('<A-d>b', dap.toggle_breakpoint)
vimp.nnoremap('<A-d>B', function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vimp.nnoremap('<A-d>L', function () dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vimp.nnoremap('<A-d>r', dap.repl.open)
vimp.nnoremap('<A-d>p', dap.run_last)

-- Trouble

vimp.nnoremap('<C-e>t', ':TroubleToggle<CR>')
vimp.nnoremap('<C-e>w', ':TroubleToggle lsp_workspace_diagnostics<CR>')
vimp.nnoremap('<C-e>d', ':TroubleToggle lsp_document_diagnostics<CR>')
vimp.nnoremap('<C-e>q', ':TroubleToggle quickfix<CR>')
vimp.nnoremap('<C-e>l', ':TroubleToggle loclist<CR>')
vimp.nnoremap('<C-e>r', ':TroubleToggle lsp_references<CR>')

-- Barbar

-- Move to previous/next
vimp.nnoremap('<A-,>', ':BufferPrevious<CR>')
vimp.nnoremap('<A-.>', ':BufferNext<CR>')
-- Re-order to previous/next
vimp.nnoremap('<A-<>', ':BufferMovePrevious<CR>')
vimp.nnoremap('<A->>', ' :BufferMoveNext<CR>')
-- Goto buffer in position...
vimp.nnoremap('<A-1>', ':BufferGoto 1<CR>')
vimp.nnoremap('<A-2>', ':BufferGoto 2<CR>')
vimp.nnoremap('<A-3>', ':BufferGoto 3<CR>')
vimp.nnoremap('<A-4>', ':BufferGoto 4<CR>')
vimp.nnoremap('<A-5>', ':BufferGoto 5<CR>')
vimp.nnoremap('<A-6>', ':BufferGoto 6<CR>')
vimp.nnoremap('<A-7>', ':BufferGoto 7<CR>')
vimp.nnoremap('<A-8>', ':BufferGoto 8<CR>')
vimp.nnoremap('<A-9>', ':BufferGoto 9<CR>')
vimp.nnoremap('<A-0>', ':BufferLast<CR>')
-- Close buffer
vimp.nnoremap('<A-c>', ':BufferClose<CR>')
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
vimp.nnoremap('<C-t>', ':BufferPick<CR>')
-- Sort automatically by...
vimp.nnoremap('<leader>bsn', ':BufferOrderByBufferNumber<CR>')
vimp.nnoremap('<leader>bsd', ':BufferOrderByDirectory<CR>')
vimp.nnoremap('<leader>bsl', ':BufferOrderByLanguage<CR>')
