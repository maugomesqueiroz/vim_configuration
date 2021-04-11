let mapleader = " "


" => Mouse support
set ttyfast " Enable mouse use in all modes
set mouse=a " Set this to the name of your terminal that supports mouse codes.
"
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


set encoding=utf-8

" If there is .vimrc in current directory, source it.
set exrc

" Relative line numbering, but keep current line
set relativenumber 
set nu 

set nowrap " Set text to not wrap aroun edge of view 
set signcolumn=yes " Add a column in the leftmost of screen to show signs

" Add color to cursor and change its shape dependind on the mode
if exists('$TMUX')
let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>[6 q\<esc>\\"
let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>]12;white\x7\<esc>\\"
let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>[2 q\<esc>\\"
let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>]12;white\x7\<esc>\\"

let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>[4 q\<esc>\\"
let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>]12;white\x7\<esc>\\"
augroup ResetCursorShape
     au!
     "autocmd VimEnter * startinsert | stopinsert
     autocmd VimEnter * normal! :startinsert :stopinsert
     "autocmd VimEnter * :normal :startinsert :stopinsert
augroup END
endif

" reset cursor when leaving tmux
" autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[2 q\033\\"
autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033]12;gray\007\033\\"
