vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-abolish'
  use 'mattn/emmet-vim'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" }
      })
    end
  }
  use {
    'ahmedkhalf/project.nvim',
    config = function ()
      require("project_nvim").setup {
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".root" },
      }
    end
  }
  use 'svermeulen/vimpeccable'
  -- use 'sbdchd/neoformat'
  use 'matze/vim-move'
  use 'kyazdani42/nvim-web-devicons'
  use 'romgrk/barbar.nvim'
  -- use 'liuchengxu/vista.vim'
  use 'christoomey/vim-tmux-navigator'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
  -- use 'shortcuts/no-neck-pain.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'windwp/nvim-ts-autotag'
  -- mrjones2014/nvim-ts-rainbow
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    requires = { 'nvim/treesitter/nvim-treesitter' }
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  }
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- "vim-test/vim-test",
      -- "nvim-neotest/neotest-vim-test",
      "haydenmeade/neotest-jest",
      "olimorris/neotest-rspec"
    }
  }
  use {
    'folke/neodev.nvim',
    config = function()
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true },
      })
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup { }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use 'tanvirtin/monokai.nvim'
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
  use "EdenEast/nightfox.nvim"
  -- use 'xiyaowong/nvim-transparent'
  use 'RRethy/vim-illuminate'
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'windwp/nvim-spectre',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use {
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use 'j-hui/fidget.nvim'
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use { "nvimdev/lspsaga.nvim", branch = "main" }
  use {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'mxsdev/nvim-dap-vscode-js',
    'suketa/nvim-dap-ruby'
  }
  use 'jbyuki/one-small-step-for-vimkind'
  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function ()
  --     require("copilot_cmp").setup()
  --   end
  -- }
  use 'onsails/lspkind.nvim'
  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function ()
      require('copilot').setup({
        panel = { enabled = false },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          -- debounce = 75,
          keymap = {
            accept = "<a-a><a-a>",
            accept_line = "<a-a><a-l>",
            accept_word = "<a-a><a-w>",
            next = "<a-a><a-n>",
            prev = "<a-a><a-p>",
            dismiss = "<a-a><a-c>",
          },
        }
      })
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
      'onsails/lspkind.nvim'
    },
    config = function()
    end
  }
  use {
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp",
    requires = { "rafamadriz/friendly-snippets" },
    config = {
      require("luasnip.loaders.from_vscode").lazy_load();
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/Sync/scripts" } });
      require("luasnip").filetype_extend("typescript", { "javascript" })
    }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
  }
  use {
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({ use_default_keymaps = false })
    end,
  }
  -- use 'rcarriga/nvim-notify'
end)
