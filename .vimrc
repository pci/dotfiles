
" No compatibility
set nocompatible
set encoding=utf-8

" Manage plugins with vim-plug
call plug#begin('~/.vim/plugged')

" Start off sensible 
Plug 'tpope/vim-sensible'

" Sometimes I think I should just auto-sync all of tpope repos
Plug 'tpope/vim-repeat'

" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'

" Tree directory
Plug 'scrooloose/nerdtree'

" Tree directory with git status icons
Plug 'Xuyuanp/nerdtree-git-plugin'

" All the Go powers
Plug 'fatih/vim-go', { 'for': 'go' }

" Motion so good it should have a health warning
Plug 'easymotion/vim-easymotion'

" Syntax checking
Plug 'scrooloose/syntastic'

call plug#end()

" Remap plugin bindings
map \ <Plug>(easymotion-prefix)
map <tab> <Plug>(easymotion-prefix)


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

" NERDTree open if you run 'vim' with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Detect filetype
filetype plugin on
" Enable syntax highighting
syntax enable
" 256 colours, please
set t_Co=256
" Dark solarized scheme
" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized

" Monokai
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme monokai

" Set relevant filetypes
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.md set filetype=markdown

" Visual decorations

" Show status line
set laststatus=2
" Show what mode you’re currently in
set showmode
" Show what commands you’re typing
set showcmd
" Allow modelines
set modeline
" Show line numbers
set number
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Highlight current line
set cursorline
" Don’t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase

" Tabs, indentation and lines

filetype plugin indent on
" 4 spaces please
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Round indent to nearest multiple of 4
set shiftround
" No line-wrapping
" set nowrap
" Set line wrapping
set wrap
set linebreak

" Since it's there
set mouse=a

" File explorer tree view
let g:netrw_liststyle=3

" Filepath autocomplete bash-style
set wildmenu
set wildmode=list:longest

" Word-processing

" Speel cheching
set spell spelllang=en_gb

" Let left and right change lines
set whichwrap+=<,>,h,l,[,]

" old habits die hard
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i

" Mappings:

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>
" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

