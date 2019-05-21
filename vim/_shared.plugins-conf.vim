"
" _shared/plugins-conf.vim
"
" Author - Michal Katnik (github.com/rideee).
"
" 
" This file contains plugins config for Neovim and Vim, managed by Vundle.


" Colorscheme palenight:
set background=dark
colo onedark
hi Normal guibg=NONE ctermbg=NONE

" FZF
set rtp+=/usr/share/fzf
noremap <C-p> :Files<CR>

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" Autoformat
noremap <Leader>a :Autoformat<CR>


" Emmet remap C-Y
let g:user_emmet_leader_key='<Leader>,'

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Surround
noremap " :normal ysiw"<CR>
noremap ' :normal ysiw'<CR>

" Synastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"
"
" You complete me
let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview

let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.', 're!\w{2}'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::', 're!\w{2}'],
  \   'perl': ['->'],
  \   'php': ['->', '::', 're!\w{2}'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.', 're!\w{2}'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }
