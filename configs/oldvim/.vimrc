
"configs
set autoindent                  "set indent after enter
set expandtab                   "set space insted of tab when pressing tab
set shiftwidth=2                "set spaces tab does
set tabstop=2                   "set max number of tabs
set number                      "set number on side
set relativenumber              "set relative number compared to the one you are currently on
set history=100                 "set max history to 100
set hlsearch                    "set hilight when searching
set showcmd                     "show command on bottom
set showmatch                   "jump to matching bracket you are on
set showmode                    "shows which mode you are in
set smartcase                   "makes it easier searching
set wildmenu                    "makes autocomplete menu
set cursorline                  "makes line on current line
set nowrap                      "disable that lines wrap around when at end of screen
set incsearch                   "show the thing you search
set ruler                       "shows where the cursor it in colom and line
set laststatus=0                "set statusbar to 0
set noerrorbells                "disables the error bell
set smartindent                 "improve indent
set background=light            "tells vim background colour for it to give good contrast
set undodir=~/.vim/undo-dd      "set where the undo file is stored
set undofile                    "sets a file where undos are saved, so if i undo and quit i can redo later
syntax on                       "enables syntax
filetype on                     "vim detects what file you are on
filetype plugin on              "enable plugins
filetype indent on              "indent
let g:airline#extensions#tabline#enabled = 1           "sets the better statusbar

"keybinds/maps
nnoremap <space>k :Files<CR>
nnoremap <space>n :bn<CR>
nnoremap <space>c :bdelete<CR>

nnoremap <Up> :FZF ~/<CR>
nnoremap <Down> :Lex<CR>
nnoremap <Left> :q<CR>
nnoremap <Right> :w<CR>


"Plug manager   install the plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-startify'                            "the startscreen for vim
Plug 'rbtnn/vim-vimscript_indentexpr'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  "the fuzzy finder, need fzf installed to work
Plug 'junegunn/fzf.vim'
Plug 'LnL7/vim-nix'                                  "nix syntax
Plug 'dense-analysis/ale'                            "lsp groundwork
Plug 'vim-airline/vim-airline'                       "the improved statusbar
Plug 'nordtheme/vim'
Plug 'MikeDacre/tmux-zsh-vim-titles'
call plug#end()

colorscheme nord                "sets colourscheme to elflord
highlight Visual ctermfg=Magenta
highlight Visual ctermbg=Black
"let g:tzvt_vim_force_tmux_title_change = 1
"let g:tzvt_vim_title_prefix = 'v:'
let g:tzvt_tzvt_vim_include_path = 0

