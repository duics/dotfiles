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
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- "vim-test/vim-test",
      -- "nvim-neotest/neotest-vim-test",
      "haydenmeade/neotest-jest"
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
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
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
    config = function()
      require("trouble").setup {}
    end
  }
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'j-hui/fidget.nvim'
  }
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use {
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          require('lspsaga').setup({})
      end,
  }
  use {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
  }
  use 'jbyuki/one-small-step-for-vimkind'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-vsnip',
      'windwp/nvim-autopairs',
      'onsails/lspkind.nvim'
    },
    config = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }
  use "rafamadriz/friendly-snippets"
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
    config = function() require'neogit'.setup {
      disable_commit_confirmation = true
    } end }
  use {
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({ use_default_keymaps = false })
    end,
  }
  -- use 'rcarriga/nvim-notify'
end)
