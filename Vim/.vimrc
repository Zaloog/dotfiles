set encoding=utf-8
set fileencoding=utf-8
set number
syntax on
set tabstop=4
set backspace=indent,eol,start
set expandtab
set hlsearch
set scrolloff=9999
set autoindent
set relativenumber
"set autocomlete to Ctrl-e
inoremap <C-E> <C-N>
"enable navigation in autocompletet with j,k
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

"change different Cursor modes
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"

"autoclose brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"visual bars for line and column
"set cursorcolumn
"hi cursorcolumn guibg=Gray20
"set cursorline
"hi clear cursorline
"hi link cursorline cursorcolumn
"set laststatus=2
