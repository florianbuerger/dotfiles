syntax on
filetype plugin indent on
set background=light

set number
set laststatus=2
set modelines=5
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set incsearch
set nojoinspaces
set display+=lastline
set backspace=indent,eol,start

" Leader ,
let mapleader=" "
map <leader>f :FZF<cr>

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Font in MacVim
if has("gui_running")
    set guifont=Inconsolata:h16
    set linespace=4
endif

" Change cursor depending on mode 
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" Replace all instances of selected word
nnoremap <c-n> :%s///g<left><left>
au BufRead,BufNewFile Podfile,Fastfile,Appfile,Deliverfile set filetype=ruby
