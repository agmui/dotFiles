call plug#begin('~/.vim/plugged')
Plug 'doums/darcula'
Plug 'itchyny/lightline.vim'
call plug#end()
set number
set ruler
syntax on

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set t_Co=256
set tabstop=4 shiftwidth=4 expandtab softtabstop=4 autoindent smartindent
colorscheme darcula
set termguicolors
set hlsearch
set showmatch
set ignorecase
set backspace=indent,eol,start
set nowrap
set shortmess=O
set scrolloff=10
set wildmenu
set incsearch
set sidescroll=1
set nowrap
set ignorecase
set laststatus=2
set cursorline
set colorcolumn=80
set timeoutlen=1000 ttimeoutlen=0
set mouse=a

"map <F10> :silent !pandoc % --pdf-engine=pdfroff -o %:r.pdf<CR>:redraw!<CR>
"map <F11> :silent !zathura %:r.pdf &<CR>

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
