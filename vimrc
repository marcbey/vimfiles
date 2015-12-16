set nocompatible              " be iMproved, required
filetype off                  " required

runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'henrik/vim-reveal-in-finder'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-vinegar'
Plugin 'lmeijvogel/vim-yaml-helper'
Plugin 'gcmt/wildfire.vim'
Plugin 'jgallen23/vim-bufsurf'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'


" All of your Plugins must be added before the following line
call vundle#end()            " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting.
syntax enable

" Turn on file type detection.
filetype plugin indent on

" Highlight current line
set cursorline

" Displaying status line always
set laststatus=2

" Highlight unwanted spaces
set list
set listchars=tab:▸\ ,eol:¬

" Set encoding
set encoding=utf-8

" Display incomplete commands.
set showcmd

" Display the mode you're in.
set showmode

" Intuitive backspacing.
set backspace=indent,eol,start

" Handle multiple buffers better.
set hidden

" Enhanced command line completion.
set wildmenu

" Complete files like a shell.
set wildmode=list:longest

" Case-insensitive searching.
set ignorecase

" But case-sensitive if expression contains a capital letter.
set smartcase

" insert tabs on the start of a line according to
set smarttab

" Show cursor position.
set ruler

" Highlight matches as you type.
set incsearch

" Highlight matches.
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Turn on line wrapping.
set wrap

" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

" No beeping.
set visualbell

" Don't make a backup before overwriting a file.
set nobackup
set nowritebackup
set noswapfile

" Global tab width.
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Use spaces instead of tabs
set expandtab

" highlight the 80 column
set colorcolumn=80

" always set autoindenting on
"set autoindent

" copy the previous indentation on autoindenting
"set copyindent

" set show matching parenthesis
set showmatch

" Toggle auto-indenting for code paste
set pastetoggle=<F2>

" Colorsettings
colorscheme solarized
set background=dark

if has('gui_running')
else
  " let g:solarized_termcolors=256
endif

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight Cursor guibg=green

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function keys
"

" Remove trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings
"

" map leader
:let mapleader = ","

" Buffer navigation
nmap <leader>1 :BufSurfBack<cr>
map <leader>2 :BufSurfForward<cr>

" Switch between the currently open buffer and the previous one,
nnoremap <leader><leader> <c-^>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Press S to replace the current word with the last yanked text.
nnoremap S diw"0P

" Press leader c to replace all currences of the word under cursor
nnoremap <Leader>c :%s/\<<C-r><C-w>\>//g<Left><Left>

" Window Splits mappings
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigarte with hyper key in window splits
map <M-C-D-S-left> <esc><C-w>h
map <M-C-D-S-down> <esc><C-w>j
map <M-C-D-S-up> <esc><C-w>k
map <M-C-D-S-right> <esc><C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File recognition
"

" Ruby files
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Json files
au BufRead,BufNewFile {*.handlebars,*.hbs,*.js.erb,*.es6,*.json} set ft=javascript

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundels & Plugins
"

" The silver Searcher ag
let g:ackprg = 'ag --skip-vcs-ignores --nogroup --nocolor --column'
let g:ag_prg="ag --skip-vcs-ignores --nogroup --nocolor --column"

" CTRL P
set runtimepath^=~/.vim/bundle/ctrlp.vim

inoremap <C-l> <esc>:CtrlPTag<cr>a
nnoremap <C-l> :CtrlPTag<cr>a

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -U -l --files-with-matches --nocolor -g ""'
let g:ctrlp_by_filename = 1
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
let g:ctrlp_use_caching = 0

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1


" Git Fugitve
nmap <leader>gs :Gstatus<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>

