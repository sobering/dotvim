"        __      __        _
"   ____/ /___  / /__   __(_)___ ___
"  / __  / __ \/ __/ | / / / __ `__ \
" / /_/ / /_/ / /_ | |/ / / / / / / /
" \__,_/\____/\__/ |___/_/_/ /_/ /_/
"
" This is my Vim configuration. There are
" many like it, but this one is mine.

if &shell =~# 'fish$'
    set shell=sh
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'honza/vim-snippets'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'whatyouhide/vim-gotham'

if executable('ctags')
    Plugin 'majutsushi/tagbar'
endif

call vundle#end()

" General
"""""""""
filetype plugin indent on
scriptencoding utf-8
set mouse=a
set mousehide
set t_vb=
set nospell
set timeoutlen=1000 ttimeoutlen=0
set nobackup
set nowb
set noswapfile

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" let g:go_fmt_command = "goimports"
autocmd CompleteDone * pclose

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])"

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
            \ if line("'\"") > -2 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" UI
""""
syntax on
set background=dark
colorscheme gotham
set number
set showmode
highlight clear SignColumn
highlight clear LineNr
set laststatus=2

set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Formatting
""""""""""""
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

" Key (re)mappings
""""""""""""""""""
let mapleader=","
let g:mapleader=","
nmap <leader>w :w!<cr>

noremap j gj
noremap k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>pp :setlocal paste!<cr>

" Get off my lawn!
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Plugins
"""""""""
" Airline {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
" }

" CtrlP {
    let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" }

" NERDTree {
    map <F3> <plug>NERDTreeToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
" }

" AutoCloseTag {
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }

" NumberToggle {
    let g:NumberToggleTrigger="<F2>"
" }

" omnicomplete {
    set completeopt=menu,longest
" }

" neocomplete {
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#max_list = 15
    let g:neocomplete#force_overwrite_completefunc = 1

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif

    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " <C-k> Complete Snippet
    " <C-k> Jump to next snippet point
    imap <silent><expr><C-k> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

    inoremap <expr><C-g> neocomplete#undo_completion()
    inoremap <expr><C-l> neocomplete#complete_common_string()
    "inoremap <expr><CR> neocomplete#complete_common_string()

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

    function! CleverCr()
        if pumvisible()
            if neosnippet#expandable()
                let exp = "\<Plug>(neosnippet_expand)"
                return exp . neocomplete#smart_close_popup()
            else
                return neocomplete#smart_close_popup()
            endif
        else
            return "\<CR>"
        endif
    endfunction

    " <CR> close popup and save indent or expand snippet
    imap <expr> <CR> CleverCr()
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplete#smart_close_popup()

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " Courtesy of Matteo Cavalleri
    function! CleverTab()
        if pumvisible()
            return "\<C-n>"
        endif
        let substr = strpart(getline('.'), 0, col('.') - 1)
        let substr = matchstr(substr, '[^ \t]*$')
        if strlen(substr) == 0
            " nothing to match on empty string
            return "\<Tab>"
        else
            " existing text matching
            if neosnippet#expandable_or_jumpable()
                return "\<Plug>(neosnippet_expand_or_jump)"
            else
                return neocomplete#start_manual_complete()
            endif
        endif
    endfunction

    imap <expr> <Tab> CleverTab()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
" }
