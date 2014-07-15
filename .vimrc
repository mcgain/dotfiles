"Richard McGain's Dotfiles
" r :normal = awesome
" "
"
" nmap Q j.
" nmap Q <nop>
"
"
" :norm or :normal = awesome
" r :normal = awesome
"
" :xnoremap . :norm.<CR>
"
" r :normal = awesome
"
"
" /term/e - poition cursor at end of match
"
" :help search
" :h offset

filetype off " required for vundle!
set nocompatible
"set encoding=utf-8

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required!
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle "git://github.com/altercation/vim-colors-solarized.git"
Bundle "sickill/vim-monokai"
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rking/ag.vim'
Bundle 'mattn/webapi-vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'dockyard/vim-easydir'
Bundle 'croaker/mustang-vim'
"Exchange two regions of text with cx
Bundle 'tommcdo/vim-exchange'

" Powerline equivalents
" Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
"enable powerlines
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'mmozuras/vim-github-comment'

" ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-rails'

" custom text objects
Bundle 'kana/vim-textobj-user.git'
Bundle 'kana/vim-textobj-entire.git'
Bundle 'kana/vim-textobj-indent.git'
Bundle 'kana/vim-textobj-syntax.git'
Bundle 'kana/vim-textobj-line.git'
Bundle 'nelstrom/vim-textobj-rubyblock.git'

"Some new ones from a tope talk
Bundle 'tpope/vim-endwise.git'

"dispatch is a test runner
" Bundle 'tpope/vim-dispatch.git'
"required for vim-textobj-rubyblock
runtime macros/matchit.vim

" Autoload this file so I don't have to reload when tweaking
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

syntax enable

colorscheme mustang
" colorscheme monokai
if &diff
  let g:solarized_termcolors=256
  colorscheme solarized
endif

set background=dark
highlight SignColumn ctermbg=234
highlight LineNr ctermbg=234

"When this isn't here, the left gutter will be grey instead of black when
"something is wrong.
" I seem to have fixed the problem, but I will leave this here for posterity
" highlight clear SignColumn

set tabstop=2
set expandtab
set number
set ignorecase
set hlsearch
set nocp
set softtabstop=2
set shiftwidth=2
set scrolloff=5 "alway have 5 lines at top/bottom of file when scrolling
set cindent
set autoindent
set smarttab
set cursorline
set nobackup "no backup files
set nowritebackup "only in case you don't want a backup file while editing
set noswapfile "no swap files

highlight MatchParen ctermbg=4

filetype plugin indent on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"disabling these keys should help me stop reaching for those keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"fj  is escape
inoremap fj <esc>:w<cr>
nnoremap fj :w<cr>

" supertab
imap <tab> g:SuperTabDefaultCompletionType

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      LEADER KEYS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

"1.8 to 1.9 Hash
nnoremap <Leader>; :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>

"Last file in jumplist
map ,, <C-^>

" statusbar always
set laststatus=2
" ;a is <ESC>
inoremap ;a <Esc>

" tagbar
map <leader>b :TagbarToggle<CR>

" K inserts newline under cursor in normal mode
nnoremap K i<CR><Esc>

" * and # search for next/previous of selected text when used in visual mode
xno * :<c-u>cal<SID>VisualSearch()<cr>/<cr>
xno # :<c-u>cal<SID>VisualSearch()<cr>?<cr>

" DANGER this removes all whitespace at end of lines on write
" This could screw up files. I guess I will find out which!
autocmd BufWritePre * :%s/\s\+$//e

fun! s:VisualSearch()
  let old = @" | norm! gvy
  let @/ = '\V'.substitute(escape(@", '\'), '\n', '\\n', 'g')
  let @" = old
endf

" better splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set splitbelow
set splitright

" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

" Y copies to system buffer
nnoremap Y "+y
" P pastes from system buffer
nnoremap P "*p

" nnoremap <c-m> :set invpaste paste?<CR>
" set pastetoggle=<c-m>
set showmode

set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to. SEEMS VERY SLOW
"github
let g:github_user = 'mcgain'

" Goto next git hunk
nmap <leader>n <Plug>GitGutterNextHunk
nmap <leader>N <Plug>GitGutterPrevHunk

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

"CtrlP stuff
let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
map <leader>t :CtrlP<cr>
let g:ctrlp_match_func = { 'match': 'GoodMatch' }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")
endfunction
