" vim plug
call plug#begin()
Plug 'sjl/gundo.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
call plug#end()

" enable ruler and line numbers
set ruler
set number

" enable solarized theme
syntax enable
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Allow backspace to cross lines
set backspace=indent,eol,start

" soft tabs ftw
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Use space as leader
let mapleader = "\<Space>"

" airline config
set noshowmode
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections=1

" jk is escape
inoremap jk <esc>

" toggle gundo, undo on steriods
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_close_on_revert=1 " Close Gundo window when reverting

" wrap text
set tw=100
set formatoptions+=t

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
set scrolloff=3

" disable cursorline in insert mode
set cul
autocmd InsertEnter,InsertLeave * set nocul!

" nicer netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide='.*\.swp$,\~$,\.orig$'

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" strip trailing spaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" insert HTML template in new HTML files
:autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl
