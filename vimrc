
" Must come first because it changes other options.
set nocompatible

" pathogen.vim : Easy manipulation of 'runtimepath', 'path', 'tags', etc
" http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

" Omni completion
set omnifunc=syntaxcomplete#Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorsettings
set background=dark
colorscheme solarized

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight Cursor guibg=green

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function keys

" Remove trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings

" map leader
:let mapleader = ","

# Buffer navigation
nmap <leader>1 :BufSurfBack<cr>
map <leader>2 :BufSurfForward<cr>

" Switch between the currently open buffer and the previous one,
nnoremap <leader><leader> <c-^>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Press S to replace the current word with the last yanked text. 
nnoremap S diw"0P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Ruby files
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Json files
au BufNewFile,BufRead *.json set ft=javascript

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundels & Plugins

" The silver Searcher ag
" Use custom ag path
"let g:agprg="/usr/local/bin/ag --column"
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL P
set runtimepath^=~/.vim/bundle/ctrlp.vim

inoremap <C-l> <esc>:CtrlPTag<cr>a
nnoremap <C-l> :CtrlPTag<cr>a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" powerline vim-airline
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gundo
nnoremap <F6> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
nmap <F7> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gitgutter
highlight clear SignColumn

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set colorcolumn=80
  autocmd WinLeave * set colorcolumn=0
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Reveal in Finder
:map <leader>e :Reveal<cr>
