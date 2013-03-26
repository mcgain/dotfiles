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
"
"no backup files
set nobackup
"only in case you don't want a backup file while editing
set nowritebackup
"no swap files
set noswapfile

call pathogen#infect()

highlight MatchParen ctermbg=4

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

map ,, <C-^>
syntax enable

" leader n inserts a newline without leaving normal mode
map <leader>n o<ESC>

" K inserts newline under cursor in normal mode
nnoremap K i<CR><Esc>

" map <leader>t :CommandTFlush<cr>\|:CommandT<cr>

" * and # search for next/previous of selected text when used in visual mode
xno * :<c-u>cal<SID>VisualSearch()<cr>/<cr>
xno # :<c-u>cal<SID>VisualSearch()<cr>?<cr>

" tagbar
nmap <F8> :TagbarToggle<CR>

" DANGER this removes all whitespace at end of lines on write
" This could screw up files. I guess I will find out which!
autocmd BufWritePre * :%s/\s\+$//e

fun! s:VisualSearch()
  let old = @" | norm! gvy
  let @/ = '\V'.substitute(escape(@", '\'), '\n', '\\n', 'g')
  let @" = old
endf

set background=dark
"When this isn't here, the left gutter will be grey instead of black when
"something is wrong.
highlight clear SignColumn


let mapleader=","
filetype plugin indent on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Y copies to system buffer
nnoremap Y "+y
" P pastes from system buffer
nnoremap P "*p

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :call RunTestFile()<cr>
map <F4> :call RunNearestTest()<cr>
map <F2> :call RunTests('')<cr>
map <F5> :call SetTestFile()<cr>
map <F6> !clear; cucumber<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable(".zeus.sock")
      exec ":!zeus rspec --color " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>
