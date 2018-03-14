" vim plug
call plug#begin('~/.vim/plugged')
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/fzf'
Plug 'sjl/gundo.vim'
Plug 'reedes/vim-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
call plug#end()

set nocompatible
filetype plugin indent on 

" enable ruler and line numbers
set ruler
set number

" enable theme
syntax enable

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

" Change cursor in insert mode
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"

let g:vim_markdown_folding_disabled = 1

" CTRL+P for fzf
nnoremap <C-p> :FZF<cr>

" Fastlane, Cocoapods
au BufNewFile,BufRead Podfile,*.podspec,Fastfile,Appfile,Deliverfile,Snapfile set filetype=ruby

" penicl
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
