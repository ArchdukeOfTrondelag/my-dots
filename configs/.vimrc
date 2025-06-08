runtime! archlinux.vim

"configs
set foldmethod=marker
set t_Co=16
set autoindent
set expandtab
set shiftwidth=2
set tabstop=4
syntax on
set number
set relativenumber
set history=100
set hlsearch
set nocompatible
set showcmd
set showmatch
set showmode
set smartcase
set wildmenu
set cursorline
syntax enable
filetype on
filetype plugin on
filetype indent on
set nowrap
set incsearch
set history=100
set wildmode=list:longest
set ruler
set laststatus=0
set noerrorbells
set smartindent
colorscheme elflord
set background=dark
set undodir=~/.vim/undo-dir
set undofile



let g:airline#extensions#tabline#enabled = 1

"keybinds/maps
let mapleader = "<Space>"
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :!fzf --preview 'bat --color=always {}'<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-c> :bdelete<CR>
nnoremap <C-a> :Startify<CR>

"Plug manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"List plugins
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'
Plug 'rbtnn/vim-vimscript_indentexpr'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'LnL7/vim-nix'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'

call plug#end()


