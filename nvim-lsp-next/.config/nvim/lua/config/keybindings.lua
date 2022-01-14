local vimp = require('vimp')
local telescope = require('telescope.builtin')

-- nvim

vim.g.mapleader = ' '

-- configs

-- vimp.nnoremap('<leader>ec', ':vsp $MYVIMRC<CR>')

function reload()
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
end

-- -- Search

-- vimp.nnoremap('<leader>sc', ':nohl<CR>')
-- vimp.nnoremap('<leader><leader>', ':nohl<CR>')
-- vimp.nnoremap('<leader>sr', ':%s/')

-- -- Terminal

-- vimp.tnoremap('<Esc>', '<C-\\><C-n>')

-- -- telescope.nvim

local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

local neogit = require('neogit')
local gitsigns = require('gitsigns')

wk.register({
  f = {
    name = "file",
    f = { telescope.find_files, "Find File" },
    g = { telescope.git_files, "Find File (git)" },
    t = { "<cmd>CHADopen<CR>", "File tree" },
    n = { "New File" },
    e = "Edit File",
  },
  s = {
    name = "search",
    s = { telescope.grep_string, "Grep string" },
    l = { telescope.live_grep, "Live grep" },
    g = { telescope.live_grep, "Live grep" },
  },
  b = {
    name = "buffers",
    b = { telescope.buffers, "Find Buffer" }
  },
  g = {
    name = "git",
    b = { telescope.git_branches, "Find branch" },
    c = {
      name = "commit",
      c = { function () neogit.open({ 'commit' }) end, "Do commit" },
      f = { telescope.git_commits, "Find commit" }
    },
    s = { neogit.open, "Git status" },
    h = {
      name = "hunk",
      s = { gitsigns.stage_hunk, "Stage hunk" },
      u = { gitsigns.undo_stage_hunk, "Unstage hunk" },
    },
    b = {
      name = "blame",
      b = { function () gitsigns.blame_line{full=true} end, "Blame line" },
    }
  },
  o = {
    name = "open",
    p = { "<cmd>CHADopen<CR>", "File tree" },
    c = { ":vsp $MYVIMRC<CR>", "Editor configuration" },
  },
  c = {
    name = "code",
    f = { vim.lsp.buf.formatting, "Format" },
  },
  r = { reload, "Reload configuration" }
}, { prefix = "<leader>" })

wk.register({
  s = { function() gitsigns.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Stage hunk" },
  u = { function() gitsigns.undo_stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Unstage hunk" }
}, { prefix = "<leader>", mode = "v" })

-- vimp.nnoremap('<C-p>', telescope.git_files)

-- vimp.nnoremap('<leader>sl', telescope.lsp_document_symbols)
-- vimp.nnoremap('<leader>sx', telescope.commands)

-- -- vimp.nnoremap('<leader>fb', telescope.file_browser)



-- -- LSP

-- vimp.nnoremap('<leader>mD', telescope.lsp_references)
-- vimp.nnoremap('<leader>md', telescope.lsp_definitions)
-- vimp.nnoremap('<leader>cD', telescope.lsp_references)
-- vimp.nnoremap('<leader>cd', telescope.lsp_definitions)
-- vimp.nnoremap('<leader>ld', vim.lsp.buf.definition)
-- vimp.nnoremap('<leader>ck', vim.lsp.buf.hover)
-- vimp.nnoremap('<leader>ci', telescope.lsp_implementations)
-- vimp.nnoremap('<leader>ch', vim.lsp.buf.signature_help)
-- vimp.nnoremap('<leader>lwa', vim.lsp.buf.add_workspace_folder)
-- vimp.nnoremap('<leader>lwr', vim.lsp.buf.remove_workspace_folder)
-- vimp.nnoremap('<leader>lwl', vim.lsp.buf.list_workspace_folders)
-- vimp.nnoremap('<leader>ct', telescope.lsp_type_definitions)
-- vimp.nnoremap('<leader>lt', vim.lsp.buf.type_definition)
-- vimp.nnoremap('<leader>cR', vim.lsp.buf.rename)
-- vimp.nnoremap('<leader>ca', function() require("code_action_menu").open_code_action_menu() end)
-- vimp.nnoremap('<leader>cr', telescope.lsp_references)
-- vimp.nnoremap('<leader>ce', telescope.lsp_document_diagnostics)
-- vimp.nnoremap('<leader>cE', telescope.lsp_workspace_diagnostics)
-- vimp.nnoremap('<leader>ek', vim.lsp.diagnostic.goto_prev)
-- vimp.nnoremap('<leader>ej', vim.lsp.diagnostic.goto_next)
-- vimp.nnoremap('<leader>lq', vim.lsp.diagnostic.set_loclist)
-- vimp.nnoremap('<leader>cf', vim.lsp.buf.formatting)

-- vimp.nnoremap('<C-m>D', telescope.lsp_references)
-- vimp.nnoremap('<C-m>d', telescope.lsp_definitions)
-- vimp.nnoremap('K', vim.lsp.buf.hover)
-- vimp.nnoremap('<C-m>i', telescope.lsp_implementations)
-- vimp.nnoremap('<C-m>h', vim.lsp.buf.signature_help)
-- vimp.nnoremap('<C-m>wa', vim.lsp.buf.add_workspace_folder)
-- vimp.nnoremap('<C-m>wr', vim.lsp.buf.remove_workspace_folder)
-- vimp.nnoremap('<C-m>wl', vim.lsp.buf.list_workspace_folders)
-- vimp.nnoremap('<C-m>t', telescope.lsp_type_definitions)
-- vimp.nnoremap('<C-m>r', vim.lsp.buf.rename)
-- vimp.nnoremap('<C-m>a', function() require("code_action_menu").open_code_action_menu() end)
-- vimp.nnoremap('<C-m>R', telescope.lsp_references)
-- vimp.nnoremap('<C-m>e', telescope.lsp_document_diagnostics)
-- vimp.nnoremap('<C-m>E', telescope.lsp_workspace_diagnostics)
-- vimp.nnoremap('<C-m>k', vim.lsp.diagnostic.goto_prev)
-- vimp.nnoremap('<C-m>j', vim.lsp.diagnostic.goto_next)
-- vimp.nnoremap('<C-m>q', vim.lsp.diagnostic.set_loclist)
-- vimp.nnoremap('<C-m>f', vim.lsp.buf.formatting)

-- -- Debug

local dap = require('dap')
local dapui = require('dapui')

wk.register({
  d = {
    name = "Debug",
    t = { dapui.toggle, "Toggle dapui" },
    j = { dap.continue, "Continue" },
    J = { dap.step_over, "Step over" },
    l = { dap.step_into, "Step into" },
    h = { dap.step_out, "Step out" },
    b = { dap.toggle_breakpoing, "Toggle breakpoint" },
    r = { dap.repl.open, "Open repl" },
    p = { dap.run_last, "Run previous configuration" },
    B = { function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Toggle breakpoint (condition)" },
    L = { function () dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, "Toggle logpoint (with message)" },
  }
}, { prefix = "<leader>" })


-- -- Trouble

-- vimp.nnoremap('<C-e>t', ':TroubleToggle<CR>')
-- vimp.nnoremap('<C-e>w', ':TroubleToggle lsp_workspace_diagnostics<CR>')
-- vimp.nnoremap('<C-e>d', ':TroubleToggle lsp_document_diagnostics<CR>')
-- vimp.nnoremap('<C-e>q', ':TroubleToggle quickfix<CR>')
-- vimp.nnoremap('<C-e>l', ':TroubleToggle loclist<CR>')
-- vimp.nnoremap('<C-e>r', ':TroubleToggle lsp_references<CR>')

-- -- Barbar

-- -- Move to previous/next
-- vimp.nnoremap('<A-,>', ':BufferPrevious<CR>')
-- vimp.nnoremap('<A-.>', ':BufferNext<CR>')
-- -- Re-order to previous/next
-- vimp.nnoremap('<A-<>', ':BufferMovePrevious<CR>')
-- vimp.nnoremap('<A->>', ' :BufferMoveNext<CR>')
-- -- Goto buffer in position...
-- vimp.nnoremap('<A-1>', ':BufferGoto 1<CR>')
-- vimp.nnoremap('<A-2>', ':BufferGoto 2<CR>')
-- vimp.nnoremap('<A-3>', ':BufferGoto 3<CR>')
-- vimp.nnoremap('<A-4>', ':BufferGoto 4<CR>')
-- vimp.nnoremap('<A-5>', ':BufferGoto 5<CR>')
-- vimp.nnoremap('<A-6>', ':BufferGoto 6<CR>')

-- vimp.nnoremap('<A-c>', ':BufferClose<CR>')
-- vimp.nnoremap('<A-x>', ':BufferClose<CR>')

-- -- Maximizer

-- vimp.nnoremap('<C-w>m', ':MaximizerToggle!<CR>')

-- -- Tests

-- vimp.nnoremap('<leader>tf', ':TestFile<CR>')
-- vimp.nnoremap('<leader>tn', ':TestNearest<CR>')
-- vimp.nnoremap('<leader>ts', ':TestSuite<CR>')
-- vimp.nnoremap('<leader>tt', ':TestLast<CR>')
-- vimp.nnoremap('<leader>tg', ':TestLast<CR>')
