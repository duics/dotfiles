local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("mason").setup()
require("mason-nvim-dap").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver" },
  automatic_installation = true,
})

require('lspsaga').setup({
  lightbulb = {
    enable = true;
    sign = false;
    virtual_text = true;
  };
})

local lsp_config = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_opts = {
  capabilities = capabilities
}

lsp_config.elixirls.setup(vim.tbl_extend("force", lsp_opts, {}))
lsp_config.lua_ls.setup(vim.tbl_extend("force", lsp_opts, {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
}))
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
lsp_config.ruby_lsp.setup(vim.tbl_extend("force", lsp_opts, {}))

vim.diagnostic.config({
  virtual_text = false,
})
require("lsp_lines").setup()
