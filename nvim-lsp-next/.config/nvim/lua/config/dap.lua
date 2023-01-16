require("nvim-dap-virtual-text").setup()

local dap = require("dap")
require("dapui").setup()

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🔵', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='🟢', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⏩', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', { text='⛔', texthl='', linehl='', numhl='' })


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
  {
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

dap.configurations.typescript = {
  {
		type = 'node2',
		name = 'Attach',
		request = 'attach',
		port = 9229,
    program = '${file}',
		-- remoteRoot = "/home/node/app",
		-- localRoot = vim.fn.getcwd(),
		restart = true,
		sourceMaps = true,
		-- smartStep = true,
		-- outFiles = { vim.fn.getcwd() .. "/dist" },
		-- trace = true,
  },
  {
		type = 'node2',
		name = 'Attach (9230)',
		request = 'attach',
		port = 9230,
    program = '${file}',
    processId = require'dap.utils'.pick_process,
		-- remoteRoot = "/home/node/app",
		localRoot = vim.fn.getcwd(),
		-- restart = true,
		sourceMaps = true,
		-- smartStep = true,
		-- outFiles = { vim.fn.getcwd() .. "/dist" },
		-- trace = true,
    cwd = vim.fn.getcwd();
    localRoot = vim.fn.getcwd();
    -- remoteRoot = '/usr/src/app';
    sourceMaps = true;
    remoteRoot = "/app/";
    skipFiles = {
      '**/node_modules/**',
      '<node_internals>/**/*.js',
    };
    protocol = 'inspector';
    console = 'integratedTerminal';
    -- outFiles = { '${workspaceFolder}/build/**/*.js', '!**/node_modules/**' };
    restart = true;
  },
}
