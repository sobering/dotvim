" If you don't understand a setting in here, just type ':h setting'.
" Uses pathogen as a git submodule
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

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

colorscheme desert
set background=dark
set t_Co=256

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Sane tab settings
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

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

" Always show the status line
set laststatus=2

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell! spelllang=en_ca<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
