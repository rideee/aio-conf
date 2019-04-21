"
" _shared/general.vim
"
" Author - Michal Katnik (github.com/rideee).
"
" 
" This file contains general configuration for both programs Neovim and Vim.


set shell=/bin/bash

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set timeoutlen=1000 ttimeoutlen=0       " No more ESC delays

set tw=79
set colorcolumn=80

set nocompatible

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
filetype plugin indent on
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Visual
syntax on
set cursorline
set showmatch
set showcmd
set number
set number relativenumber

set linebreak
set showbreak=""

set hlsearch
set smartcase
set ignorecase
set incsearch

set wrap
" set textwidth=0
" set wrapmargin=0

set undolevels=1000
set background=dark

set guicursor=a:blinkon0

" relative number
noremap <Leader>` :set number relativenumber!<CR>

" :nohl
noremap <Leader>/ :nohl<CR>

" New line
nmap <CR> <S-o><Esc>

" Buffer mapping
noremap <C-]> :bnext<CR>
noremap <C-[> :bprev<CR>
map <Leader>] :bnext<CR>
map <Leader>[ :bprev<CR>
map <Leader>q :bd<CR>

" Clipboard
vnoremap <C-S-c> "+y<CR>
noremap <Leader>y "+y

" netrw (:Explore -- build in vim)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
map <C-n> :Vex<CR>

