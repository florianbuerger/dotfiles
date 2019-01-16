call plug#begin('~/.local/share/nvim/plugged')
" Languages
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'itspriddle/vim-marked'
Plug 'dag/vim-fish'

" Editor
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'mileszs/ack.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'

" Colors
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-dark'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'fatih/molokai'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-solarized8'

call plug#end()

set ttyfast

set number
set title
set termguicolors
colorscheme gruvbox
set background=dark

" Showcase comments in italics
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic

set cursorline
set list
set listchars=tab:▸\ ,eol:¬
set fillchars+=vert:\
set tabstop=2
set shiftwidth=2
set noexpandtab
set scrolloff=5
set sidescrolloff=10
set foldmethod=marker
set autoindent

set wrap
set linebreak
set nolist

set mouse=a
set fileformats=unix
set encoding=utf-8
set nobackup
set nowb
set noswapfile
set hidden
set autoread
set incsearch
set hlsearch
set clipboard=unnamed
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set showcmd
set completeopt-=preview
set laststatus=2
set statusline=%f\ %=%{&fenc}\ %y
set lazyredraw

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" increase max memory to show syntax highlighting for large files
set maxmempattern=20000

" live substitution
set inccommand=nosplit

" Open new splits to the right & bottom as every other editor on this earth
set splitright
set splitbelow

" Print full path using ctrl f
map <C-i> :echo expand("%:p")<cr>

" autcomplete
let g:deoplete#enable_at_startup = 1

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype c setlocal foldmethod=syntax foldnestmax=1
autocmd BufNewFile,BufRead AppFile,Fastfile,Deliverfile,Podfile,*.podspec set filetype=ruby

" keys
let mapleader = " "

fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

nnoremap <silent> <Leader>ff :exe 'GFiles ' . <SID>fzf_root()<CR>
nnoremap <silent> <Leader>f :GFiles<CR>
" nnoremap <silent> <Leader>c :Colors<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>; :Commands<CR>
nnoremap <silent> <Leader>h :Helptags<CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>lb :BLines<CR>

" Clear search highlight
nnoremap <Leader><space> :noh<cr>

" Mappings for vim-test
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
let test#ruby#use_spring_binstub = 1

" Force neovim for vim-test
" somehow it doesn't recognize it
let test#strategy = "tmux"

" Use ag with ack
let g:ackprg = 'ag --vimgrep'

" Do not open the first match by default
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" NERDTree
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>/ :NERDTreeFind<cr>
let NERDTreeShowHidden=0

" Neomake

" Use simple >> for neomake
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
hi MyWarningMsg ctermbg=3 ctermfg=0
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'MyWarningMsg',
            \ }
call neomake#configure#automake('w')
