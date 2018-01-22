call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
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
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jszakmeister/vim-togglecursor'
call plug#end()


" make sure we stop pretending...
set nocompatible

" code folding
set foldmethod=syntax
set foldlevelstart=20
set foldnestmax=10
set foldlevel=1


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

" lightline config
set laststatus=2
set noshowmode " do not display status, lightline will do that
let g:lightline = { 'colorscheme': 'solarized' }

" color scheme
colorscheme solarized
set background=dark

" syntax highlighting
syntax on
filetype on                 " enables filetype detection
filetype plugin indent on   " enables filetype specific plugins

" remap leader
let mapleader = ","

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
"
" move between buffers
set hidden
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprev<cr>

" split with something I can remember
nnoremap <leader>h <C-w>s
nnoremap <leader>v <C-w>v

" get rid of escape delays
set timeoutlen=1000 ttimeoutlen=10
