" -- Compability -- "

set encoding=utf-8  " always encode in utf
set nocompatible    " use vim defaults instead of vi
set viminfo+=n~/.vim/tmpfile/viminfo

" -- Plugins -- "

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' 
Plugin 'L9'
Plugin 'powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'

map <C-n> :NERDTreeToggle<CR>

call vundle#end()

" -- Settings -- "

" File detection
filetype plugin indent on
execute pathogen#infect()
syntax on

" -- ColorSheme -- "

"colorscheme molokai 
"colorscheme monokain 
"colorscheme Monokai 
"colorscheme material 
"colorscheme solarized 
"colorscheme hybrid 
"colorscheme darkblue 
"colorscheme hybrid_material 
"colorscheme zenburn 
"colorscheme onedark 
"colorscheme Tomorrow-Night 

"-- Statusline --"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set noshowmode
set showtabline=2

" -- Syntastic -- "
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -- NerdTree -- "
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
    
" -- Powerline -- "

set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim
let g:powerline_pycmd="py3"
let g:PowerLine_symbols  = 'fancy'
"let g:PowerLine_stl_path_style = 'short'

let g:python2_host_prog = "/usr/local/bin/python2.7"
let g:python3_host_prog = "/usr/local/bin/python3.7"

" -- vim airline -- "
let g:airline_powerline_fonts = 1

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enble = 1

" General
set background=dark            " dark background
set directory^=$HOME/backups/  " put all swap files together in one place
set backspace=2                " enable <BS> for everything
set completeopt-=preview       " dont show preview window
set fillchars+=vert:\          " empty space instead of broken line for vsplits 
set hidden                     " hide when switching buffers, don't unload
set laststatus=2               " always show status line
set lazyredraw                 " don't update screen when executing macros
set mouse=a                    " enable mouse in all modes
set wrap                       " word wrap
set linebreak                  " attempt to wrap lines cleanly
set number relativenumber      " show line numbers
set nocursorline               " highlight cursor line
set title                      " use filename in window title
set ttyfast                    " you've got a fast terminal

" Folding
set foldignore=                " don't ignore anything when folding
set foldlevelstart=99          " no folds closed on open
set foldmethod=marker          " collapse code using markers

" Tabs
set autoindent                 " copy indent from previous line
set expandtab                  " replace tabs with spaces
set shiftwidth=4               " spaces for autoindenting
set smarttab                   " <BS> removes shiftwidth worth of spaces
set softtabstop=4              " spaces for editing, e.g. <Tab> or <BS>
set tabstop=4                  " spaces for <Tab>

" Searches
set hlsearch                   " highlight search results
set incsearch                  " search whilst typing
set ignorecase                 " case insensitive searching
set smartcase                  " override ignorecase if upper case typed
set showcmd                    " show command on last line of screen
set showmatch                  " show bracket matches
set textwidth=0                " don't break lines after some maximum width
set wildmenu                   " enhanced cmd line completion
set ruler                      " shows ruler

" vimdiff
if &diff
  set diffopt=filler,foldcolumn:0
endif

" -- Mappings -- "

" Map leader
let mapleader = ','

" Exit insert mode
inoremap jj <esc>

" Toggle fold
nnoremap <space> za

" Toggle spellcheck
nnoremap <leader>s :set spell!<CR>

" Toggle hlsearch for current results
nnoremap <leader><leader> :nohlsearch<CR>

" Insert newline in normal mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Search for trailing whitespace
nnoremap <leader>w /\s\+$<CR>

" Toggle method used for folding
nnoremap <leader>m :call ToggleFoldMethod()<CR>

" Paste mode for terminals
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Insert current date and time
nnoremap <leader>d "=strftime("%d %b, %Y %X")<CR>p
nnoremap <leader>D "=strftime("%d %b, %Y %X")<CR>P

" Shortcut for Tabularize 
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /

" Search and open buffer, files, recent
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>

" -- Plugin Settings -- "

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|__pycache__$',
      \ 'file': '\.pyc$\|\.so$\|\.swp$',
      \ }

let g:dwm_master_pane_width=96

" -- Functions -- "

function! ToggleFoldMethod()
if &foldmethod == 'indent'
    set foldmethod=marker
    echo "foldmethod=marker"
else
    set foldmethod=indent
    echo "foldmethod=indent"
endif
endfunction

" -- Open NerdTree at start -- "
"autocmd vimenter * NERDTree

