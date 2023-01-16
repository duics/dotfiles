require("neotest").setup({
  log_level = vim.log.levels.DEBUG,
  adapters = {
    require('neotest-jest')({
      jestCommand = "npm test --",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
  },
  output = {
    enabled = true,
    open_on_run = true,
  }
})
