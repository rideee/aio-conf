"
" init.vim
"
" Author - Michal Katnik (github.com/rideee)
"
" This is the root file that initializes the Neovim and Vim configurations.


" import shared modules
runtime _shared.general.vim

if has("nvim")
  " imports nvim modules
  runtime _nvim.main.vim
else
  " import vim modules
  runtime _vim.main.vim
endif


" Vundle plugin manager
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Shared plugins
runtime _shared.plugins.vim

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on  " allows auto-indenting depending on file type


" Configuration file for shared plugins
runtime _shared.plugins-conf.vim
