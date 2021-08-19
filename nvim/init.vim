" Plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
"Plug 'majutsushi/tagbar'
"Plug 'vim-syntastic/syntastic'
"Plug 'tpope/vim-surround'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tommcdo/vim-lion'
"Plug 'ntpeters/vim-better-whitespace'
call plug#end()

" Theme
colorscheme gruvbox
set termguicolors
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts=1

" Editor settings
set number
set nowrap
set expandtab
set colorcolumn=120
set shell=/bin/bash

