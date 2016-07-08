" Enable vim-plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
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
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Use `jj` for escape
imap jj <Esc>

" Navigate splits without ctrl-w j, just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split on bottom or right
set splitbelow
set splitright

" Wrap like a proper text editor
set formatoptions=l
set lbr

"
" NERDTree
"
let g:NERDTreeWinSize=40

" Auto open when opening vim without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree using ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Treat Fastfile, Snapfile, Podfile as ruby
au BufRead,BufNewFile Podfile,Fastfile,Snapfile set filetype=ruby

" Enable markdown
au BufNewFile,BufFilePre,BufRead *.md,*.markdown set filetype=markdown

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

" Enable YAML frontmatter in markdown files
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1 " disable folding
