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
	use {
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				config = {
					header = { 
						" |/////////| ",
						" | ___ ___ | ",
						" |  O   O  | ",
						" |   ___   | ",
						" |   |_|   | ",
						" |  _____  | ",
						" |  _____  | ",
						" |         | ",
						" |         | ",
						"****************************************************************************************************************************************************************************************************************************",
						" "
					},
					shortcut = {
						{
							icon = ':3 ',
							desc = 'Files ',
							group = 'Label',
							action = 'FzfLua files',
							key = 'f',
						},
					},
					footer = {
						" ",
						"NixOS BTW"
					}
				}
			}
		end,
		requires = {'nvim-tree/nvim-web-devicons'}
	}
end)

