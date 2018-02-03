
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" start vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ctrlpvim/ctrlp.vim'
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" end vundle

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim		" this is in /usr/share/vim/vim80/defaults.vim

" file browser config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
"let g:netrw_browse_split = 4	" seems like this is bugged
let g:netrw_altv = 1
let g:netrw_winsize = 15 
let g:netrw_list_hide = netrw_gitignore#Hide()

set tabstop=4
set shiftwidth=4
set nowrap
set title
set hidden

let mapleader=" "
:nnoremap <leader>w <c-w>w
:nnoremap <leader>f :Explore<CR>
":nnoremap <leader>f :Explore<CR>
:inoremap jk <Esc>
:inoremap <CR> <CR>x<BS>

set wildmenu " what is this?
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=**/node_modules
set nobackup
set noswapfile
set ignorecase
set number
set backspace=indent,eol,start
highlight LineNr ctermfg=grey

"packadd! matchit

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  "set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    "set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  set autoindent		" we always want simple autoindent 
  filetype plugin indent off	" turn off language specific indentation, overrides /usr/share/vim/vim80/defaults.vim

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif
