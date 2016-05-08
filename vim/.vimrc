" Enable vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'dag/vim-fish'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/syntastic'
call plug#end()

set shell=$SHELL

" Make backspace behave in a sane manner
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Enable file type detection and do language dependent indenting
filetype plugin indent on

" Use `,` for leader
let mapleader = ","

set wildmenu
set wildmode=list:longest
set cursorline
set ruler
set relativenumber
set undofile

" Use `jj` for escape
imap jj <Esc>

" Navigate splits without ctrl-w j, just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"
" NERDTree
"
" Auto open when opening vim without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree using ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Treat Fastfile, Snapfile, Podfile as ruby
au BufRead,BufNewFile Podfile,Fastfile,Snapfile set filetype=ruby

" Search for all lowercase -> case insensitive, 
" case-sensitive if one character in search input 
" is uppercase
set ignorecase
set smartcase
" Show results as soon as you type
set showmatch
set incsearch
set hlsearch
" Clear search results with ,<space>
nnoremap <leader><space> :noh<cr>
" Use tab to highlight matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Hardcore mode, disable arrow keys :)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Use ; for : 
nnoremap ; :

" Save file when focus is lost
au FocusLost * :wa

" Enable JSX syntax and indent in JS files
let g:jsx_ext_required = 0

