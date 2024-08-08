return {
  'wbthomason/packer.nvim',
  'tpope/vim-surround',
  'tpope/vim-projectionist',
  'tpope/vim-abolish',
  'mattn/emmet-vim',
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end
  },
  {
    "LintaoAmons/cd-project.nvim",
    config = function()
      require("cd-project").setup({
        projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
        project_dir_pattern = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".root" },
        choice_format = "both",
        projects_picker = "telescope",
        auto_register_project = true,
        hooks = {
          {
            callback = function(dir)
              vim.notify("switched to dir: " .. dir)
            end,
          },
          {
            callback = function(_)
              vim.cmd("Telescope find_files")
            end,
          },
        },
      })
    end
  },
  'svermeulen/vimpeccable',
  -- 'sbdchd/neoformat',
  'matze/vim-move',
  'kyazdani42/nvim-web-devicons',
  'romgrk/barbar.nvim',
  -- 'liuchengxu/vista.vim',
  'christoomey/vim-tmux-navigator',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  -- 'shortcuts/no-neck-pain.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "typescript", "tsx", "php", "javascript", "html", "json", "elixir", "eex", "heex", "markdown", "markdown_inline", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false,
        highlight = {
          enable = true,
          -- disable = { "markdown" },  -- list of language that will be disabled
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          -- additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
          },
        }
      })
    end
  },
  'windwp/nvim-ts-autotag',
  -- mrjones2014/nvim-ts-rainbow
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- "vim-test/vim-test",
      -- "nvim-neotest/neotest-vim-test",
      "haydenmeade/neotest-jest",
      "olimorris/neotest-rspec"
    },
  },
  {
    'folke/neodev.nvim',
    config = function()
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true },
      })
    end
  },
  {
    "folke/which-key.nvim",
    lazy = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  'tanvirtin/monokai.nvim',
  'folke/tokyonight.nvim',
  'rebelot/kanagawa.nvim',
  'EdenEast/nightfox.nvim',
  -- 'xiyaowong/nvim-transparent',
  'RRethy/vim-illuminate',
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-project.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } } },
  {
    'windwp/nvim-spectre',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  },
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  {
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  'j-hui/fidget.nvim',
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  { "nvimdev/lspsaga.nvim",          branch = "main" },
  {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'mxsdev/nvim-dap-vscode-js',
    'suketa/nvim-dap-ruby',
  },
  'jbyuki/one-small-step-for-vimkind',
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function ()
  --     require("copilot_cmp").setup()
  --   end
  -- },
  'onsails/lspkind.nvim',
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = { },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          -- debounce = 75,
          -- f
          keymap = {
            accept = "<a-a>",
            accept_line = "<a-A>",
            accept_word = "<a-w>",
            next = "<a-n>",
            prev = "<a-p>",
            dismiss = "<a-c>",
          },
        },
      })
    end
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --     { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  --   },
  --   opts = {
  --     -- debug = true, -- Enable debugging
  --     -- See Configuration section for rest
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
      'onsails/lspkind.nvim',
    },
    config = function()
    end
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    --  config = {
    --    require("luasnip.loaders.from_vscode").lazy_load();
    --    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/Sync/scripts" } });
    --    require("luasnip").filetype_extend("typescript", { "javascript" })
    --  },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
  },
  {
    'TimUntersberger/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({ use_default_keymaps = false })
    end,
  },
  -- 'rcarriga/nvim-notify',
}
