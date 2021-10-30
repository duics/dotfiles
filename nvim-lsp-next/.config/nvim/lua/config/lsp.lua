vim.g.coq_settings = {
  auto_start = true and 'shut-up'
}

local coq = require('coq')
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = function (client)
        require 'illuminate'.on_attach(client)
      end
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(coq.lsp_ensure_capabilities(opts))
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- vim-illuminate
vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
