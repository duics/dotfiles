local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

local lsp_installer = require("nvim-lsp-installer")

require("nvim-lsp-installer").setup({
    ensure_installed = { "sumneko_lua", "tsserver" },
    automatic_installation = true,
})

local lsp_config = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_opts = {
  on_attach = function (client)
    require('illuminate').on_attach(client)
  end,
  capabilities = capabilities
}

lsp_config.elixirls.setup(vim.tbl_extend("force", lsp_opts, {}))
lsp_config.sumneko_lua.setup(vim.tbl_extend("force", lsp_opts, {}))
lsp_config.tsserver.setup(vim.tbl_extend("force", lsp_opts, {}))
lsp_config.eslint.setup(vim.tbl_extend("force", lsp_opts, {}))
lsp_config.emmet_ls.setup(vim.tbl_extend("force", lsp_opts, {}))
lsp_config.tailwindcss.setup({
  capabilities = capabilities,
  -- TODO: Figure out why lsp settings are not working
  settings = {
    emmetCompletions = true
  },
  init_options = {
    userLanguages = {
      heex = "html"
    }
  }
})
lsp_config.html.setup(vim.tbl_extend("force", lsp_opts, {}))
lsp_config.intelephense.setup(vim.tbl_extend("force", lsp_opts, {}))


-- vim-illuminate
vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
