vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'airblade/vim-rooter'
  use 'svermeulen/vimpeccable'
  use 'sbdchd/neoformat'
  use 'matze/vim-move'
  use 'szw/vim-maximizer'
  use 'kassio/neoterm'
  use 'romgrk/barbar.nvim'
  use 'liuchengxu/vista.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'vim-test/vim-test'
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup { }
    end
  }
  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
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
  use 'RRethy/vim-illuminate'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
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
    'p00f/nvim-ts-rainbow',
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  }
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use 'kosayoda/nvim-lightbulb'
  use {
    'weilbith/nvim-code-action-menu',
  }
  use {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
  }
  use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'}
  use {
    "lukas-reineke/indent-blankline.nvim",
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require'neogit'.setup {
      disable_commit_confirmation = true
    } end }
  use 'AndrewRadev/splitjoin.vim'
  use {
    { 'ms-jpq/coq_nvim', branch = 'coq' },
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  }
end)
