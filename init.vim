call plug#begin('~/.local/share/nvim/plugged')
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'https://github.com/pangloss/vim-javascript'

" Colors
Plug 'morhetz/gruvbox'
call plug#end()

" appearance
" set termguicolors
" let g:gruvbox_italic=1
" colorscheme gruvbox

set number
set relativenumber
" switch to normal line numbers in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set cursorline
set list
set listchars=tab:▸\ ,eol:¬
set fillchars+=vert:\ 
set tabstop=2
set shiftwidth=2
set noexpandtab
set scrolloff=5
set foldmethod=marker
set autoindent

set wrap
set linebreak
set nolist

" background
set mouse=a
set fileformats=unix
set encoding=utf-8
set nobackup
set nowb
set noswapfile
set hidden
set timeoutlen=1000 ttimeoutlen=0
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
set statusline=%t\ %=%{&fenc}\ %y

" autcomplete
let g:deoplete#enable_at_startup = 1

" js
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 80
let g:prettier#config#bracket_spacing = 'true'

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype c setlocal foldmethod=syntax foldnestmax=1
autocmd BufWritePre *.js,*.jsx,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync
autocmd BufRead,BufNewFile AppFile,Fastfile,Deliverfile,Podfile, *.podspec set ft=ruby

" Since gruvbox inverts cursor color, it could be awkward to determine current position, when the search is highlighted. To get single cursor color while searching, map these gruvbox functions somewhere after unimpaired is loaded 

" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" keys
let mapleader = " "

fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

nnoremap <silent> <Leader>ff :exe 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <Leader>fc :Colors<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>; :Commands<CR>
nnoremap <silent> <Leader>h :Helptags<CR>
nnoremap <silent> <Leader>ll :Lines<CR>
nnoremap <silent> <Leader>lb :BLines<CR>

" Clear search highlight
nnoremap <Leader><space> :noh<cr>
