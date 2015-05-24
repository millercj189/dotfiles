""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" v0.6
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"  Sections:
"    > General
"    > Keybinds
"    > Theme
"    > User Interface
"    > Misc
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set history=1024
set laststatus=2
set linebreak

set nobackup
set nowb
set noswapfile

set noerrorbells
set novisualbell


" Global Tab Settings
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab


" C
autocmd Filetype c setlocal noexpandtab tabstop=8 softtabstop=8 shiftwidth=8


" Python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :
nnoremap : ;

set autoindent
set smartindent
filetype indent on

set modelines=1

set backspace=indent,eol,start
set clipboard=unnamed



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colors desert

set colorcolumn=80
highlight ColorColumn ctermbg=magenta

set cmdheight=2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                   " Enable syntax processing
set number                      " Show line numbers
set showcmd                     " Show command in bottom bar
set cursorline                  " Highlight current line
set ttyfast                     " Faster redraw
set wildmenu
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set scrolloff=3                 " Scroll within 3 lines of margins

autocmd VimEnter * NERDTree     " Start NERDTree plugin on start
let g:NERDTreeWinSize=30        " Set NERDTree width to 'X' columns

set ignorecase                  " Ignore case when searching
set smartcase                   " Attempt intelligent use of cases
set showmatch                   " Highlight matching parenthesis
set incsearch                   " Search as characters are entered
set hlsearch                    " Highlight all matches

set splitright                  " Puts new vsplit windows right of the current



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoclose NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Tmux
if exists('$TMUX') " allows cursor change in tmux mode
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
