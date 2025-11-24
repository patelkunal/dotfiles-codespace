" Basic Settings
set nocompatible              " Use Vim settings, rather than Vi settings
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set ruler                     " Show cursor position
set showcmd                   " Show command in bottom bar
set cursorline                " Highlight current line
set wildmenu                  " Visual autocomplete for command menu
set showmatch                 " Highlight matching [{()}]
set laststatus=2              " Always show status line

" Indentation
set tabstop=4                 " Number of visual spaces per TAB
set softtabstop=4             " Number of spaces in tab when editing
set shiftwidth=4              " Number of spaces to use for autoindent
set expandtab                 " Tabs are spaces
set autoindent                " Copy indent from current line when starting new line
set smartindent               " Smart autoindenting when starting new line

" Search
set incsearch                 " Search as characters are entered
set hlsearch                  " Highlight matches
set ignorecase                " Ignore case in searches
set smartcase                 " Override ignorecase if search contains capitals

" Performance
set lazyredraw                " Redraw only when needed

" File handling
set encoding=utf-8            " Use UTF-8 encoding
set autoread                  " Reload files changed outside vim
set hidden                    " Allow buffer switching without saving

" Backups
set nobackup                  " No backup files
set nowritebackup             " No backup while editing
set noswapfile                " No swap files

" Interface
syntax enable                 " Enable syntax highlighting
set background=dark           " Dark background
set mouse=a                   " Enable mouse support

" Key mappings
" Clear search highlighting
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better command-line editing
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" File type settings
filetype plugin indent on     " Enable file type detection and plugins
