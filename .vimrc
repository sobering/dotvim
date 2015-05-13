" I use the fish shell, so this is necessary
set shell=/bin/bash

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'danro/rename.vim'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'mxw/vim-jsx'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sjl/gundo.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Switch syntax highlighting on
syntax on

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

let mapleader=","
let g:mapleader=","

" Faster saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set to auto read when a file is changed from the outside
set autoread

" I like line numbers
set number

" Always show current position
set ruler

" Command bar height
set cmdheight=2

" Hide buffer when it becomes abandoned
set hid

" Ignore case when searching
set ignorecase

" Be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

set background=dark
colorscheme desert

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Sane tab settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Get off my lawn!
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell! spelllang=en_ca<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Always show the status line
set laststatus=2

" Ignore certain files in tab-completion
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

highlight SignColumn ctermbg=black
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" If no files are specified when vim opens, show NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Navigate long lines in a sane manner
nmap j gj
nmap k gk

" CtrlP
nmap ; :CtrlPBuffer<CR>
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
