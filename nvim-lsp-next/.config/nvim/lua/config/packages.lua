vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'szw/vim-maximizer'
  use 'kassio/neoterm'
  use 'tpope/vim-commentary'
  use 'sbdchd/neoformat'
  use 'neovim/nvim-lspconfig'
  use 'svermeulen/vimpeccable'
  use 'tanvirtin/monokai.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
end)
