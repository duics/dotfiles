require("nvim-dap-virtual-text").setup()

local dap = require("dap")
require("dapui").setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "left",
    },
    {
      elements = {
        { id = "repl", size = 0.45 },
        { id = "console", size = 0.55 },
      },
      size = 0.27,
      position = "bottom",
    },
  },
})

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🔵', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='🟢', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⏩', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', { text='⛔', texthl='', linehl='', numhl='' })

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    ... -- see below
  }
end

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.local/opt/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}

dap.configurations.javascript = {
  -- {
  --   type = 'node2',
  --   request = 'launch',
  --   program = '${workspaceFolder}/${file}',
  --   cwd = vim.fn.getcwd(),
  --   sourceMaps = true,
  --   protocol = 'inspector',
  --   console = 'integratedTerminal',
  -- },
}

dap.configurations.typescript = {
{
  {
    type = "pwa-node",
    request = "launch",
    name = "Debug Jest Tests (monorepo)",
    -- trace = true, -- include debugger info
    runtimeExecutable = "pnpm",
    runtimeArgs = {
      'test',
      -- "./node_modules/jest/bin/jest.js",
      -- "--runInBand",
    },
    rootPath = "${workspaceFolder}",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    internalConsoleOptions = "neverOpen",
  }
}
  -- {
		-- type = 'node2',
		-- name = 'Attach',
		-- request = 'attach',
		-- port = 9229,
  --   program = '${file}',
		-- -- remoteRoot = "/home/node/app",
		-- -- localRoot = vim.fn.getcwd(),
		-- restart = true,
		-- sourceMaps = true,
		-- -- smartStep = true,
		-- -- outFiles = { vim.fn.getcwd() .. "/dist" },
		-- -- trace = true,
  -- },
  -- {
		-- type = 'node2',
		-- name = 'Attach (9230)',
		-- request = 'attach',
		-- port = 9230,
  --   program = '${file}',
  --   processId = require'dap.utils'.pick_process,
		-- -- remoteRoot = "/home/node/app",
		-- localRoot = vim.fn.getcwd(),
		-- -- restart = true,
		-- sourceMaps = true,
		-- -- smartStep = true,
		-- -- outFiles = { vim.fn.getcwd() .. "/dist" },
		-- -- trace = true,
  --   cwd = vim.fn.getcwd();
  --   localRoot = vim.fn.getcwd();
  --   -- remoteRoot = '/usr/src/app';
  --   sourceMaps = true;
  --   remoteRoot = "/app/";
  --   skipFiles = {
  --     '**/node_modules/**',
  --     '<node_internals>/**/*.js',
  --   };
  --   protocol = 'inspector';
  --   console = 'integratedTerminal';
  --   -- outFiles = { '${workspaceFolder}/build/**/*.js', '!**/node_modules/**' };
  --   restart = true;
  -- },
}
