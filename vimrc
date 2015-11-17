" ------------------------------------------------------------
" Vundle
" ------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Other plugins
Plugin 'wookieHangover/jshint.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'


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
" Allow modelines, screw debian
" ------------------------------------------------------------

set modeline
set modelines=5


" ------------------------------------------------------------
" Numeric keyboard
" ------------------------------------------------------------
"  I think this might only have been used under Synergy
"  So that could probably be removed

map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OR *
map <Esc>OQ /
map <Esc>Ol +
map <Esc>OS -

map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OR *
map! <Esc>OQ /
map! <Esc>Ol +
map! <Esc>OS -

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


