set nocompatible
filetype plugin indent on

" Enable syntax highlight
syntax on
set background=light

set ruler
set number

" Sane wrapping
set wrap
set linebreak
set nolist  " list disables linebreak

imap jk <Esc>
nmap ; :

com! FormatJSON %!python -m json.tool

" Tabs & Spaces
set bs=indent,eol,start               " allow backspacing over everything
set autoindent                        " enable auto-indentation
set tabstop=2                         " no. of spaces for tab in file
set shiftwidth=2                      " no. of spaces for step in autoindent
set softtabstop=2                     " no. of spaces for tab when editing
set expandtab                         " expand tabs into spaces
set smarttab                          " smart tabulation and backspace

" Then I use an additional block to set indentation for exceptions.
if has("autocmd")
  augroup styles
    autocmd!
    " Custom filetypes settings: Python, Shell, Go, JSON, Vagrant
    au FileType python,sh set tabstop=4 shiftwidth=4 softtabstop=4
    au FileType go set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
    au BufRead,BufNewFile *.json setfiletype javascript
    au BufRead,BufNewFile Vagrantfile setfiletype ruby
  augroup END
endif

" show filename
set title

" show (partial) command
set showcmd

" start scrolling three lines before border
set scrolloff=3

set cul
autocmd InsertEnter,InsertLeave * set nocul!

" nicer netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide='.*\.swp$,\.DS_Store'

" strip trailing spaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Share clipboard with macOS
set clipboard=unnamed

