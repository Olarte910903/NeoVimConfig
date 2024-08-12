let mapleader = " "

call plug#begin('~/.local/share/nvim/plugged')
set encoding=utf8
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
