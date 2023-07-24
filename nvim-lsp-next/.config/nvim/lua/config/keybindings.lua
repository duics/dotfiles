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
local neotest = require("neotest")
local spectre = require('spectre')

local opts = { path_display = { "truncate" } }

wk.register({
  a = {
    name = "alternate",
    a = { "<cmd>A<CR>", "Jump to alternative" },
    v = { "<cmd>AV<CR>", "Jump to alternative (vsplit)" },
    s = { "<cmd>AS<CR>", "Jump to alternative (split)" },
    t = { "<cmd>AT<CR>", "Jump to alternative (tab)" },
  },
  e = {
    name = "edit",
    c = { ':vsp $MYVIMRC<CR>', "Neovim configuration" }
  },
  f = {
    name = "file",
    f = { function () telescope.find_files(opts) end, "Find File" },
    g = { function () telescope.git_files(opts) end, "Find File (git)" },
    t = { "<cmd>NvimTreeToggle<CR>", "File tree" },
    n = { "New File" },
    e = "Edit File",
  },
  s = {
    name = "search",
    s = { function() telescope.live_grep({ path_display = { "truncate" } }) end, "Live grep" },
    S = { spectre.open, "Open Spectre" },
    w = { function() spectre.open_visual({select_word=true}) end, "Search word" },
    f = { spectre.open_file_search, "Open Spectre (file)" },
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
    B = {
      name = "blame",
      b = { function () gitsigns.blame_line{full=true} end, "Blame line" },
    },
    y = {
      function () require"gitlinker".get_buf_range_url("n") end, "Yank github url"
    },
  },
  o = {
    name = "open",
    p = { "<cmd>NvimTreeFindFileToggle<CR>", "File tree" },
    c = { ":vsp $MYVIMRC<CR>", "Editor configuration" },
    t = { "<cmd>Lspsaga term_toggle<CR>", "Terminal" },
  },
  p = { function() require("telescope").extensions.projects.projects({}) end, "Projects" },
  w = {
    name = "Window",
    c = { '<cmd>NoNeckPain<CR>', 'Center' }
  },
  c = {
    name = "code",
    a = { '<cmd>Lspsaga code_action<CR>', "Code action" },
    f = { vim.lsp.buf.format, "Format" },
    -- d = { function() telescope.lsp_definitions(opts) end, "Definitions" },
    -- D = { function() telescope.lsp_references(opts) end, "References" },
    d = { '<cmd>Lspsaga goto_definition<CR>', "Go to definition" },
    D = { '<cmd>Lspsaga goto_type_definition<CR>', "Go to type defintion" },
    e = { '<cmd>TroubleToggle document_diagnostics<CR>', "Errors" },
    c = { '<cmd>Lspsaga finder<CR>', "Find references" },
    h = { '<cmd>Lspsaga outline<CR>', "Help" },
    r = { '<cmd>Lspsaga rename<CR>', "Rename" },
    i = { vim.lsp.buf.implementation, "Implementation" },
    E = { require("lsp_lines").toggle, "Toggle LSP inline errors" },
  },
  r = { reload, "Reload configuration" },
  t = {
    name = "test",
    f = { function() neotest.run.run(vim.fn.expand('%')) end, 'Test file' },
    F = { function() neotest.run.run({ vim.fn.expand('%'), strategy = "dap" }) end, 'Test file (debug)' },
    t = { function() neotest.run.run() end, 'Test nearest' },
    T = { function() neotest.run.run({ strategy = "dap" }) end, 'Test nearest (Debug)' },
    S = { function() neotest.run.stop() end, 'Stop test' },
    a = { function() neotest.run.attach() end, 'Attach' },
    o = { function() neotest.output_panel.toggle() end, 'Output' },
    s = { function() neotest.summary.toggle() end, 'Summary' },
  },
}, { prefix = "<leader>" })

wk.register({
  s = { function() gitsigns.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Stage hunk" },
  u = { function() gitsigns.undo_stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "Unstage hunk" }
}, { prefix = "<leader>", mode = "v" })

vimp.nnoremap('<C-p>', function() telescope.find_files(opts) end)

vimp.nnoremap('<A-s>', require('treesj').toggle)

-- Vsnip
vim.cmd [[
   " Expand or jump
   " imap <expr> <C-s>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
   " smap <expr> <C-s>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

   " Jump forward or backward
   " imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
   " smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
   " imap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'
   " smap <expr> <C-k> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'


" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
  " imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
  " inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

  " snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(1)<Cr>
  " snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]

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
vimp.nnoremap('K', '<cmd>Lspsaga hover_doc<CR>')
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
    b = { dap.toggle_breakpoint, "Toggle breakpoint" },
    r = { dap.repl.open, "Open repl" },
    p = { dap.run_last, "Run previous configuration" },
    B = { function () dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, "Toggle breakpoint (condition)" },
    S = { function() require"osv".launch({port = 8086}) end, 'Start nvim debug session' },
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
vimp.nnoremap('<A-,>', ':BufferPrevious<CR>')
vimp.nnoremap('<A-.>', ':BufferNext<CR>')
-- -- Re-order to previous/next
vimp.nnoremap('<A-<>', ':BufferMovePrevious<CR>')
vimp.nnoremap('<A->>', ' :BufferMoveNext<CR>')
-- -- Goto buffer in position...
vimp.nnoremap('<A-1>', ':BufferGoto 1<CR>')
vimp.nnoremap('<A-2>', ':BufferGoto 2<CR>')
vimp.nnoremap('<A-3>', ':BufferGoto 3<CR>')
vimp.nnoremap('<A-4>', ':BufferGoto 4<CR>')
vimp.nnoremap('<A-5>', ':BufferGoto 5<CR>')
vimp.nnoremap('<A-6>', ':BufferGoto 6<CR>')

vimp.nnoremap('<A-c>', ':BufferClose<CR>')
vimp.nnoremap('<A-x>', ':BufferClose<CR>')

-- -- Tests

-- vimp.nnoremap('<leader>tf', ':TestFile<CR>')
-- vimp.nnoremap('<leader>tn', ':TestNearest<CR>')
-- vimp.nnoremap('<leader>ts', ':TestSuite<CR>')
-- vimp.nnoremap('<leader>tt', ':TestLast<CR>')
-- vimp.nnoremap('<leader>tg', ':TestLast<CR>')
