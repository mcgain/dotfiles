set tabstop=2
set expandtab
set number
set ignorecase
set hlsearch
set nocp
set softtabstop=2
set shiftwidth=2
set cindent
set autoindent
set smarttab
set cursorline

call pathogen#infect()

highlight MatchParen ctermbg=4

map ,, <C-^>
syntax enable
  
" run the tests, this assumes I have a run_tests file
map <F2> :w\|!clear; ruby spec/run_tests.rb <cr>
map <F3> :w\|!clear; spec/run_tests.sh <cr>
 
" leader n inserts a newline without leaving normal mode
map <leader>n o<ESC>

" * and # search for next/previous of selected text when used in visual mode
xno * :<c-u>cal<SID>VisualSearch()<cr>/<cr>
xno # :<c-u>cal<SID>VisualSearch()<cr>?<cr>

" tagbar
nmap <F8> :TagbarToggle<CR>

fun! s:VisualSearch()
        let old = @" | norm! gvy
        let @/ = '\V'.substitute(escape(@", '\'), '\n', '\\n', 'g')
        let @" = old
endf

set background=dark
let mapleader=","
filetype plugin indent on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

nnoremap P "*p

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
