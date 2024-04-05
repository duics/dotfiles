require("neotest").setup({
  -- log_level = vim.log.levels.DEBUG,
  adapters = {
    require('neotest-jest')({
      -- jestCommand = "npm test --",
      jestCommand = "npx jest --config jest.config.ts --",
      env = { CI = true },
      jest_test_discovery = true,
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-rspec"),
  },
  discovery = {
    -- Must be disabled with jest_test_discovery
    enabled = false,
  },
  output = {
    enabled = true,
    open_on_run = 'short',
  }
})
