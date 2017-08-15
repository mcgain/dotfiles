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

set nocompatible
filetype off " required for vundle!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
"  " required!
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'nixprime/cpsm'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'sickill/vim-monokai'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rking/ag.vim'
Plugin 'mattn/webapi-vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'dockyard/vim-easydir'
Plugin 'croaker/mustang-vim'
Plugin 'tommcdo/vim-exchange' "Exchange two regions of text with cx
Plugin 'Yggdroot/indentLine' "Thin vertical lines on indents

Plugin 'terryma/vim-multiple-cursors' "

Plugin 'bling/vim-airline'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Complete github usernames with C-x C-o
Plugin 'tpope/vim-rhubarb'
Plugin 'mmozuras/vim-github-comment'


" custom text objects
Plugin 'kana/vim-textobj-user.git'
Plugin 'kana/vim-textobj-entire.git'
Plugin 'kana/vim-textobj-indent.git'
Plugin 'kana/vim-textobj-syntax.git'
Plugin 'kana/vim-textobj-line.git'
Plugin 'nelstrom/vim-textobj-rubyblock.git'
Plugin 'wellle/targets.vim.git' "so many more text objects
Plugin 'michaeljsmith/vim-indent-object.git' "does this do the same thing as
" the indent thing above

Plugin 'justinmk/vim-sneak'

"Some new ones from a tope talk
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-abolish.git'

"unixy filesystem stuff like proper file renames using :Move,
":Mkdir, :Chmod, :Remove, :Rename, :SudoWrite
Plugin 'tpope/vim-eunuch'

" ruby
Plugin 'vim-ruby/vim-ruby'
let g:ruby_indent_assignment_style = 'variable'

Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake.git'
Plugin 'tpope/vim-rails'

autocmd FileType ruby setlocal iskeyword+=?,! " include ? and ! in ruby words

"evaluate ruby inline
Plugin 't9md/vim-ruby-xmpfilter'
autocmd FileType ruby nmap <buffer> <leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <leader>m <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <leader>r <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <leader>r <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>r <Plug>(xmpfilter-run)
"Now I'm using <leader>o for opening files, in normal mode I need to disable
" the default thing for new tabs
nmap <leader>t <ESC>

" ,% copy filename to clipboard
nmap <Leader>% :let<Space>@*=@%<CR>

" GO
Plugin 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

"open current target in split
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

"open godoc under cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

"list of interfaces implemented by type
au FileType go nmap <Leader>s <Plug>(go-implements)

"tags
set tags=./tags;/

" Lua
Plugin 'vim-scripts/lua.vim'
Plugin 'vim-scripts/vim-misc'
"dispatch is a test runner
" Bundle 'tpope/vim-dispatch.git'

"Rust
Plugin 'wting/rust.vim'

"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

Plugin 'rizzatti/dash.vim' "Dash documentation lookup service

Plugin 'w0rp/ale' "Asynchronous Lint Engine, runs rubocop

Plugin 'elixir-lang/vim-elixir'

call vundle#end()            " required by Vundle

"ALE Configuration
" call ale#linter#Define('ruby', {
" \   'name': 'be-rubocop',
" \   'executable': 'rubocop',
" \   'command': 'bundle exec rubocop --format emacs --stdin _',
" \   'callback': 'ale_linters#ruby#rubocop#Handle',
" \})

" let g:ale_linters = {'ruby': ['be-rubocop']}

"Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])

"required for vim-textobj-rubyblock
runtime macros/matchit.vim

" Autoload this file so I don't have to reload when tweaking
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


syntax enable
"force *.md to markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

colorscheme mustang
" colorscheme monokai
if &diff
  let g:solarized_termcolors=256
  colorscheme solarized
endif

" set termguicolors "in vim8
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
set synmaxcol=120 "only do syntax highlighting up to 120 chars on long lines

set clipboard=unnamed "use system keyboard

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

"fj  is escape and write
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
map <leader>/ :TagbarToggle<CR>

" copy current file path to clipboard
map <leader>@ :let @+ = expand("%:p")<CR>

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

"highlight lines that are too long
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
nmap <F6> :IndentLinesToggle<CR>

"map Dash lookup of word under cursor to ,d
nmap <silent> <leader>d <Plug>DashSearch
"CtrlP stuff
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
" map <leader>t :CtrlP<cr>
let g:ctrlp_match_func = { 'match': 'GoodMatch' }
let g:ctrlp_use_caching = 0

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
" nnoremap <leader>o :call SelectaCommand("find * -type f", "", ":e")<cr>
nnoremap <leader>o :CtrlP<cr>

function! SelectaBuffer()
  let buffers = map(range(1, bufnr("$")), 'bufname(bufnr(v:val))')
  call SelectaCommand('echo "' . join(buffers, "\n") . '"', "", ":b")
endfunction

" Fuzzy select a buffer. Open the selected buffer with :b.
" nnoremap <leader>b :call SelectaBuffer()<cr>

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

iabbr bpry require'pry-byebug';binding.pry
iabbr xxx puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
