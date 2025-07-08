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
	use 'vim-airline/vim-airline'
	use 'mhinz/vim-startify'
	use 'junegunn/fzf'
	use {'ibhagwan/fzf-lua', requires = { {'nvim-tree/nvim-web-devicons'} } }
	use 'shaunsingh/nord.nvim'
	use {'akinsho/bufferline.nvim', requires = {'nvim-tree/nvim-web-devicons'} }

	
	use({
		"0x15ba88ff/tnew.nvim",
		config = function()
			require("tnew").setup()
		end,
		cmd = { "Tnew", "TnewList", "TnewClean" },
	})
	use{
		"otavioschwanck/fzf-lua-enchanted-files",
		requires = { "ibhagwan/fzf-lua" },
		config = function()
			require("fzf-lua-enchanted-files").setup()
		end
	}

end)

