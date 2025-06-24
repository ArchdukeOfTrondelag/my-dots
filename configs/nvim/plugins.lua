-- ~/.config/nvim/lua/plugins.lua

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use "nvim-lua/plenary.nvim" 
  use 'nvim-tree/nvim-web-devicons'
  use {"ThePrimeagen/harpoon", branch = "harpoon2", requires = { {"nvim-lua/plenary.nvim"} } }
  use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'mhinz/vim-startify'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'junegunn/fzf'
  use {'ibhagwan/fzf-lua', requires = { {'nvim-tree/nvim-web-devicons'} } }
  use 'Dimercel/todo-vim'
  use 'shaunsingh/nord.nvim'
  use {'akinsho/bufferline.nvim'}  --, requires = {"nvim-tree/nvim-web-devicons"} }
end)

