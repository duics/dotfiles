return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "tpope/vim-projectionist",
    keys = { { "<leader>fa", "<cmd>Alternate<cr>", desc = "Alternative file" } },
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "cs",
        update_n_lines = "csn",
      },
    },
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
  },
  -- {
  --   "pasky/claude.vim",
  --   cmd = {
  --     "ClaudeImplement",
  --     "ClaudeChat",
  --   },
  --   keys = {
  --     { "<leader>ac", "<cmd>ClaudeChat<cr>", mode = { "n" }, desc = "Claude chat" },
  --     { "<leader>ai", "<cmd>ClaudeImplement!<cr>", mode = { "v" }, desc = "Claude implement" },
  --   },
  --   config = function()
  --     local api_key
  --     local file = io.open("/home/maxsal/.claude", "r")
  --     if file then
  --       api_key = file:read()
  --       file:close()
  --     end
  --     if api_key then
  --       vim.g.claude_api_key = api_key
  --     else
  --       vim.notify("API key not found from ~/.claude", vim.log.levels.WARN)
  --     end
  --   end,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "copilot",
  --       group_index = 1,
  --       priority = 100,
  --     })
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = true,
  --         auto_refresh = true,
  --         keymap = {},
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         -- debounce = 75,
  --         -- f
  --         keymap = {
  --           accept = "<a-a>",
  --           accept_line = "<a-A>",
  --           accept_word = "<a-w>",
  --           next = "<a-n>",
  --           prev = "<a-p>",
  --           dismiss = "<a-c>",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
