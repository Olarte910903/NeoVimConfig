let mapleader = " "
let g:airline_theme = 'kolor'
set encoding=UTF-8

call plug#begin('~/.local/share/nvim/plugged')
set encoding=utf8
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jwalton512/vim-blade'

call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Atajo para formatear con PHP CS Fixer
nnoremap <leader>pcf :!php-cs-fixer fix %<CR>

" Atajo para formatear con Prettier
nnoremap <leader>pf :!prettier --write %<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

"Configuración AirLine
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
"Temas de color
colorscheme molokai

lua << EOF
require('mason').setup()

require("mason-lspconfig").setup({
    ensure_installed = { "intelephense", "volar", "html" },
    automatic_installation = true,
})

local lspconfig = require('lspconfig')

-- Configurar PHP (Laravel)
lspconfig.intelephense.setup{}

-- Configurar Vue
lspconfig.volar.setup{}

-- Configurar HTML (útil para Blade)
lspconfig.html.setup{}
--Aquí eliminé blade después de html
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "php", "vue", "html" },
  highlight = {
    enable = true,
  },
}

-- Instalar herramientas adicionales
local mason_registry = require("mason-registry")
local function ensure_installed()
    local packages = {
        "php-cs-fixer",
        "prettier",
    }
    for _, package in ipairs(packages) do
        local p = mason_registry.get_package(package)
        if not p:is_installed() then
            p:install()
        end
    end
end
ensure_installed()

EOF


