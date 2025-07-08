require('plugins')

vim.cmd([[
nnoremap <C-k> :FzfLuaFiles<CR>
nnoremap <M-k> :FzfLua files ~/.cache/nvim/tnew/<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-c> :bdelete<CR>
nnoremap <C-a> :Startify<CR>
nnoremap <M-m> :set cursorline<CR>
nnoremap <M-n> :set nocursorline<CR>
nnoremap <M-s> :w<CR>
nnoremap <M-w> :q<CR>
nnoremap <F5> :Tnew<CR>

autocmd VimEnter * hi Visual guifg=magenta  
set scrolloff=6
set t_Co=16
set number
set relativenumber
set undodir=~/.vim/undo-di      "set where the undo file is stored
set undofile                    "sets a file where undos are saved, so if i undo and quit i can redo later
]])

vim.g.nord_italic = false
require('nord').set()

local bufferline = require('bufferline')
bufferline.setup({
	options = {
		style_preset = bufferline.style_preset.no_italic,
	}
})


