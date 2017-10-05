" vim plug
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
call plug#end()

syntax on
filetype plugin indent on
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

set number
set laststatus=2
set modelines=5
set vb t_vb=
set ts=4 sts=4 sw=4 expandtab
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set nojoinspaces
set incsearch
set hlsearch "Highlight search matches
set backspace=indent,eol,start

" airline config
set noshowmode
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections=1

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

" Clear search with ,<space>
nnoremap <silent><leader><leader> :noh<return>

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

" nicer netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide='.*\.swp$,\~$,\.orig$'

" disable cursorline in insert mode
set cul
autocmd InsertEnter,InsertLeave * set nocul!

