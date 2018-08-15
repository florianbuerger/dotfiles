call plug#begin('~/.local/share/nvim/plugged') 
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural splits
" opens to right & bottom
set splitbelow
set splitright
