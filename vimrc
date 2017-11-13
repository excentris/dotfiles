call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'plasticboy/vim-markdown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fugitive'
call plug#end()


" make sure we stop pretending...
set nocompatible

" code folding
set foldmethod=indent
set foldlevel=2
set foldnestmax=4

" indentation
set autoindent
set softtabstop=4 shiftwidth=4 expandtab

" no more wondering why backspace didn't do what I expected...
set backspace=indent,eol,start

" use the clipboard
set clipboard=unnamed

" visual
highlight Normal ctermbg=black
set cursorline

" color scheme
colorscheme solarized
set background=dark

" syntax highlighting
syntax on
filetype on                 " enables filetype detection
filetype plugin indent on   " enables filetype specific plugins

" remap leader
let mapleader = ","

" lusty
set hidden

" searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr> " stop highlighting search

" long lines
set colorcolumn=100

" avoid breaking words when wrapping
set linebreak

" numbers
set number
set numberwidth=3

" easymotion config
let g:EasyMotion_do_mapping = 0 " disable default mappings
nmap s <Plug>(easymotion-s2)
nmap f <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1 " case insensitive

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>e :Buffers<CR>
