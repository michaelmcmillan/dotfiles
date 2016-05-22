set nocompatible              " be iMproved, required
filetype off                  " required

set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch

" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

:set t_Co=256 " 256 colors
:set background=dark
:color grb256

" let the mouse resize splits
set mouse=n

" comment and un-comment n lines
let @c="I#\ej"
let @u="^xj"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

Plugin 'airblade/vim-gitgutter'

Bundle 'https://github.com/gorodinskiy/vim-coloresque.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

:set wildignore+=src/bibliography/locales,src/bibliography/schema,src/bibliography/styles,venv,.git,node_modules,node_modules/*,__init__.py,*.pyc,*.swp,*.png,*.jpg,*.gif,*.DS_Store

let mapleader=","

:highlight SignColumn ctermbg=black
:set nu

let &t_Co=256
set tabstop=4
set shiftwidth=4
set softtabstop=4
syntax on

" lets do it old school motherfucker
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" set interactive shell
" set shellcmdflag=-ic

" run test
nnoremap <leader>T :!/Users/michaelmcmillan/scripts/t<cr>

" Restore cursor
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


set backspace=2 " make backspace work like most other apps

" Width 80
 autocmd FileType text setlocal textwidth=78

" it-macro
let @a='i^Iit('', function (done) {});<80>kl<80>kl<80>kl^M^M<80>ku<80>ku<80>kr<80>kr<80>kr<80>kr<80>kr^['

" rel line no
set relativenumber
