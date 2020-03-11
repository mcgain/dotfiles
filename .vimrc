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

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Autoload this file so I don't have to reload when tweaking
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost ~/.vimrc source ~/.vimrc
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

call plug#begin('~/.vim/bundle')

" This needs to be before all my <leader> mappings
let mapleader=","


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Find the string under the cursor accross files in project, using fzf and rg
set grepprg=rg\ --vimgrep
command! -bang -nargs=* RipGrepFind call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <leader>p :RipGrepFind <c-r><c-w><cr>

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>o :Files<cr>

Plug 'nixprime/cpsm'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
" Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister' "{register, defaults to "}"gr{motion}
Plug 'mattn/webapi-vim'
Plug 'tomtom/tcomment_vim'
Plug 'dockyard/vim-easydir'
Plug 'croaker/mustang-vim'
Plug 'tommcdo/vim-exchange' "Exchange two regions of text with cx
Plug 'Yggdroot/indentLine' "Thin vertical lines on indents
Plug 'bling/vim-airline'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mmozuras/vim-github-comment'


" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-line'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'wellle/targets.vim' "so many more text objects
Plug 'michaeljsmith/vim-indent-object' "does this do the same thing as
" the indent thing above

Plug 'justinmk/vim-sneak'

"Some new ones from a tope talk
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'

"unixy filesystem stuff like proper file renames using :Move,
":Mkdir, :Chmod, :Remove, :Rename, :SudoWrite
Plug 'tpope/vim-eunuch'

" ruby
Plug 'vim-ruby/vim-ruby'
let g:ruby_indent_assignment_style = 'variable'

Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'

" change {} to do end with gS and gJ
Plug 'AndrewRadev/splitjoin.vim'

autocmd FileType ruby setlocal iskeyword+=?,! " include ? and ! in ruby words

"evaluate ruby inline
Plug 't9md/vim-ruby-xmpfilter'
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
Plug 'fatih/vim-go'
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
Plug 'vim-scripts/lua.vim'
Plug 'vim-scripts/vim-misc'
"dispatch is a test runner
" Bundle 'tpope/vim-dispatch'

"Rust
let g:rustfmt_command='cargo fmt'
let g:rustfmt_autosave = 1
Plug 'wting/rust.vim'

"Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

Plug 'w0rp/ale' "Asynchronous Lint Engine, runs rubocop

Plug 'elixir-lang/vim-elixir'

Plug 'bogado/file-line'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "dunno what this is for the language client needs it i think

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

call plug#end()

call deoplete#enable()
call deoplete#custom#var('tabnine', { 'line_limit': 500, 'max_num_results': 20 })

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


"force *.md to markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

colorscheme mustang
" colorscheme monokai
if &diff
  let g:solarized_termcolors=256
  colorscheme solarized
endif

set termguicolors "in vim8
set background=dark
highlight SignColumn ctermbg=234
highlight LineNr ctermbg=234

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
" imap <tab> g:SuperTabDefaultCompletionType

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      LEADER KEYS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"Hopefully makes ESC work to get out of terminal mode
tnoremap <Esc> <C-\><C-n>

"highlight lines that are too long
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
nmap <F6> :IndentLinesToggle<CR>

"Doc search with zeal
Plug 'KabbAmine/zeavim.vim'
let g:zv_zeal_executable = '/mnt/c/Program Files/Zeal/zeal.exe'

nmap <leader>z :let @+ = expand("%")<CR>

iabbr bpry require'pry-byebug';binding.pry
iabbr xxx puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

"make everything writable when I want to write it
function! g:ChmodOnWrite()
  if v:cmdbang
    silent !chmod u+w %
  endif
endfunction

autocmd BufWrite * call g:ChmodOnWrite()
