"Richard McGain's Dotfiles
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

let mapleader="," " This needs to be before all my <leader> mappings

"Fuzzy file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Find the string under the cursor accross files in project, using fzf and rg
set grepprg=rg\ --vimgrep
command! -bang -nargs=* RipGrepFind call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'source': 'rg --files --no-ignore-vcs -g "!node_modules"'}, <bang>0)
nnoremap <leader>p :RipGrepFind <c-r><c-w><cr>
" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>o :Files<cr>

Plug 'tpope/vim-surround' "useful cs{( kinda stuff
Plug 'tpope/vim-repeat' "very important, works with a bunch of stuff
Plug 'vim-scripts/ReplaceWithRegister' "{register, defaults to \"}\"gr{motion}
Plug 'tomtom/tcomment_vim' "gcc commenting
Plug 'dockyard/vim-easydir' "Create intermediate folders when writing files
Plug 'tommcdo/vim-exchange' "Exchange two regions of text with cx
Plug 'Yggdroot/indentLine' "Thin vertical lines on indents <F6>
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
nmap <F6> :IndentLinesToggle<CR>
Plug 'bling/vim-airline' "status line thing down the bottom
Plug 'airblade/vim-gitgutter' "+ - etc. in the left hand column
Plug 'tpope/vim-fugitive' "git stuff
Plug 'tpope/vim-rhubarb' " #Github integration for fugitive
let g:github_user = 'mcgain'
Plug 'wellle/targets.vim' "so many more text objects
Plug 'AndrewRadev/splitjoin.vim' " change {} to do end with gS and gJ ruby blocks etc
Plug 'bogado/file-line' "can open files with line numbers: vim foo.rb:20

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "dunno what this is for the language client needs it i think
let g:deoplete#enable_at_startup = 1
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'w0rp/ale' "Asynchronous Lint Engine, runs rubocop / prettier
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'css': ['prettier'],
\ 'ruby': ['prettier'],
\}
let g:ale_linters_explicit = 1 " Disable auto ALE, just do the stuff above
let g:ale_fix_on_save = 1

"go to two characters with s. sea goes to the next occurence of ea
" with operators, its used with z, so dtzab deletes to the next occurence of
" ab
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-endwise' "Adds end to defs and ifs and stuff
Plug 'tpope/vim-abolish' "substitutions for :Subert/di{e,ce}/spinner{,s}/

"unixy filesystem stuff like proper file renames using :Move,
":Mkdir, :Chmod, :Remove, :Rename, :SudoWrite
Plug 'tpope/vim-eunuch'

" ruby
Plug 'vim-ruby/vim-ruby'
let g:ruby_indent_assignment_style = 'variable'
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user' " custom text objects
Plug 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim "required for vim-textobj-rubyblock
autocmd FileType ruby setlocal iskeyword+=?,! " include ? and ! in ruby words
nnoremap <Leader>; :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR> "1.8 to 1.9 Hash

autocmd BufWrite * call g:ChmodOnWrite()
autocmd FileType ruby nmap <buffer> <leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <leader>m <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <leader>m <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <leader>r <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <leader>r <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>r <Plug>(xmpfilter-run)

"Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown "force *.md to markdown instead of modula-2

" Lua
Plug 'vim-scripts/lua.vim'
Plug 'vim-scripts/vim-misc'

"Javascript / Typescript / React
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'

"svelte
au! BufNewFile,BufRead *.svelte set ft=html

"tags
set tags=./tags;/

set termguicolors "in vim8
set background=dark
highlight SignColumn ctermbg=234
highlight LineNr ctermbg=234
set tabstop=2
set expandtab
set number "line numbers on the left
set ignorecase "ignore case in patterns
set hlsearch "highlight searches
set nocp "nocompatible - nvim is always this
set softtabstop=2
set shiftwidth=2
set scrolloff=5 "alway have 5 lines at top/bottom of file when scrolling
set cindent
set autoindent
set smarttab
set cursorline "highlight the current line
set nobackup "no backup files
set nowritebackup "only in case you don't want a backup file while editing
set noswapfile "no swap files
set synmaxcol=120 "only do syntax highlighting up to 120 chars on long lines
set clipboard=unnamed "use system keyboard
set laststatus=2 " statusbar always

highlight MatchParen ctermbg=4 "highlight the paired bracket in colour 4

filetype plugin indent on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"disabling these keys should help me stop reaching for those keys
" reminder:
" with i = insert mode. Without i = normal mode
" noremap = map the key and don't allow any more mapping
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

"Last file in jumplist
map ,, <C-^>

" copy current file path to clipboard
map <leader>@ :let @+ = expand("%:p")<CR>
" ,% copy filename to clipboard
nmap <Leader>% :let<Space>@*=@%<CR>

nnoremap K i<CR><Esc> " K inserts newline under cursor in normal mode

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

set showmode nosmd
set wildmenu            " visual autocomplete for command menu

" Goto next git hunk
nmap <leader>n <Plug>GitGutterNextHunk
nmap <leader>N <Plug>GitGutterPrevHunk

"Hopefully makes ESC work to get out of terminal mode
tnoremap <Esc> <C-\><C-n>

"highlight lines that are too long
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

nmap <leader>z :let @+ = expand("%")<CR>

iabbr bpry require'pry-byebug';binding.pry
iabbr xxx puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

"make everything writable when I want to write it
function! g:ChmodOnWrite()
  if v:cmdbang
    silent !chmod u+w %
  endif
endfunction

"Now I'm using <leader>o for opening files, in normal mode I need to disable
" the default thing for new tabs
nmap <leader>t <ESC>

Plug 'sonph/onehalf', {'rtp': 'vim/'}



" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   -- One of "all", "maintained" (parsers with maintainers), or a list of languages
"   ensure_installed = {"ruby", "javascript", "typescript", "json", "markdown"},
" }
" EOF

" this needs to be called after plug#end
call deoplete#custom#var('tabnine', { 'line_limit': 500, 'max_num_results': 20 })

colorscheme onehalfdark "must be called after plug#end

"Airline Configuration
" the calls must be after plug#end
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
