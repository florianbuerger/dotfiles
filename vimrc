" Disable compatibility mode
set nocompatible

" Enable syntax highlight
syntax on
colorscheme delek

filetype plugin indent on
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
