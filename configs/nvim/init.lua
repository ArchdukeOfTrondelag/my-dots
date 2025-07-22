require('plugins')

vim.cmd([[

nnoremap <C-k> :FzfLuaFiles<CR>
nnoremap <M-k> :FzfLua files ~/.cache/nvim/tnew/<CR>
nnoremap <C-l> :FzfLua buffers<CR>

nnoremap <C-n> :bn<CR>
nnoremap <C-c> :bdelete<CR>
nnoremap <M-c> :bdelete!<CR>

nnoremap <M-s> :w<CR>
nnoremap <M-w> :q<CR>

nnoremap <F2> :Tnew<CR>

nnoremap <F3> :terminal<CR>
tnoremap <M-Esc> <C-\><C-n>

autocmd VimEnter * hi Visual guifg=magenta  

set cursorline
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


