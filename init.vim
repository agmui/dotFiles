call plug#begin('~/.vim/plugged')
    Plug 'lervag/vimtex'
    Plug 'preservim/nerdcommenter'
    Plug 'doums/darcula'
    Plug 'itchyny/lightline.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'godlygeek/tabular'
    " Plug 'plasticboy/vim-markdown'
    Plug 'aklt/plantuml-syntax'
    Plug 'tyru/open-browser.vim'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    Plug 'nathanaelkane/vim-indent-guides'
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
" set cursorline
" set relativenumber
set colorcolumn=80
set timeoutlen=1000 ttimeoutlen=0
set mouse=a
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set clipboard=unnamed
set clipboard=unnamedplus

"map <F10> :silent !pandoc % --pdf-engine=pdfroff -o %:r.pdf<CR>:redraw!<CR>
"map <F11> :silent !zathura %:r.pdf &<CR>
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

"nerd commenter
filetype plugin on

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'
" let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" rainbow indent
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_enable_on_vim_startup = 1

" spell checking for spesific file types
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END
