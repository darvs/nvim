" ------------------------------------------------------------
" Vundle
" ------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin('~/.dotfiles/vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Other plugins
Plugin 'wookieHangover/jshint.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'


" " All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on


" ------------------------------------------------------------
" Matsie's Autocomplete
" ------------------------------------------------------------

filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <lt>/ </<C-X><C-O>

" ------------------------------------------------------------
" Syntastic
" ------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------------------------------------------------------------
" Use common config
" ------------------------------------------------------------
source ~/vimrc.common

