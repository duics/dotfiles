vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'airblade/vim-rooter'
  use 'svermeulen/vimpeccable'
  use 'sbdchd/neoformat'
  use 'szw/vim-maximizer'
  use 'kassio/neoterm'
  use 'tanvirtin/monokai.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'p00f/nvim-ts-rainbow',
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  }
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require'neogit'.setup {} end }
  use 'AndrewRadev/splitjoin.vim'
  use {
    { 'ms-jpq/coq_nvim', branch = 'coq' },
    { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  }
end)