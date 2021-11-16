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
		name = 'Node attach',
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
}
