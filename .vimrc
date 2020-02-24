colorscheme tender

syntax enable
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set ttimeoutlen=10
set spelllang=en,cjk
set foldmethod=marker

set number
set title
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set wrapscan
" 現在の行を強調表示
set cursorline
set hidden

" :
set clipboard+=unnamed

set backspace=indent,eol,start

" mapleader's setting
let mapleader = "\;"
nmap <Leader>h <C-w>h <CR>
nmap <Leader>j <C-w>j <CR>
nmap <Leader>k <C-w>k <CR>
nmap <Leader>l <C-w>l <CR>

" CTRL+hjkl で上下左右のウインドウに移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" インデント
nnoremap == gg=G''

" terminal mode をescで抜ける
tnoremap <silent> <ESC> <C-\><C-n>

" terminal
nnoremap t :sp <Enter> <C-w>j :terminal <Enter> i

" tab可視化
"et list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set list
set listchars=eol:↲,tab:>-,trail:~,extends:>,precedes:<

" vim-plug
call plug#begin()
"color
Plug 'jacoborus/tender.vim'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'simeji/winresizer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cohama/lexima.vim'
Plug 'glidenote/memolist.vim'
call plug#end()
