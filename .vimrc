" vim plug
call plug#begin('~/.vim/plugged')
Plug 'sjl/gundo.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" enable ruler and line numbers
set ruler
set number

" enable theme
syntax enable
colorscheme nord
set background=dark
set t_Co=256

" Allow backspace to cross lines
set backspace=indent,eol,start

" soft tabs ftw
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Use space as leader
let mapleader = "\<Space>"

" status line config
set showmode
set laststatus=2

" jk is escape
inoremap jk <esc>

" toggle gundo, undo on steriods
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_close_on_revert=1 " Close Gundo window when reverting

" ignore case of searches
set ignorecase

" highlight dynamically as pattern is typed
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" show the filename in the window titlebar
set title

" don’t reset cursor to start of line when moving around
set nostartofline

" show the (partial) command as it’s being typed
set showcmd

" don’t reset cursor to start of line when moving around
set nostartofline

" don’t add empty newlines at the end of files
set noeol

" start scrolling three lines before the horizontal window border
set scrolloff=5

" disable cursorline in insert mode
set cul
autocmd InsertEnter,InsertLeave * set nocul!

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Format JSON files
map <leader>jt  :%!python -m json.tool<CR>
