vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-tree/nvim-web-devicons'
	use 'vim-airline/vim-airline'
	use 'junegunn/fzf'
	use {'ibhagwan/fzf-lua', requires = { {'nvim-tree/nvim-web-devicons'} } }
	use 'shaunsingh/nord.nvim'
	use {'akinsho/bufferline.nvim', requires = {'nvim-tree/nvim-web-devicons'} }
end)

