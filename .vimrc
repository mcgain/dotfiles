set tabstop=2
set expandtab
set number
set ignorecase
set hlsearch
set nocp

highlight MatchParen ctermbg=4

map ,, <C-^>
syntax enable

set cindent
set autoindent
set smarttab
set expandtab


" * and # search for next/previous of selected text when used in visual mode
xno * :<c-u>cal<SID>VisualSearch()<cr>/<cr>
xno # :<c-u>cal<SID>VisualSearch()<cr>?<cr>

fun! s:VisualSearch()
        let old = @" | norm! gvy
        let @/ = '\V'.substitute(escape(@", '\'), '\n', '\\n', 'g')
        let @" = old
endf


if has("gui_running")
        colorscheme solarized
        set background=dark
        set nocompatible bs=2
endif
