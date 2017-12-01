" ------------------------------------------------------------
" Vundle
" ------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

if &compatible
  set nocompatible            " be iMproved
endif
set runtimepath+=~/.dotfiles/dein.vim

if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  call dein#add('~/.dotfiles/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('w0rp/ale')
  call dein#add('vim-airline/vim-airline')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('guns/xterm-color-table.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" set theme
let g:airline_theme='nord'
colorscheme nord

" activate deoplete
let g:deoplete#enable_at_startup = 1 

set number              " Show the line numbers on the left side.

" darvs-patch colorscheme 
highlight LineNr ctermfg=08
highlight ErrorMsg ctermfg=15 ctermbg=88 guifg=#00FF00 guibg=#BF616A

" remove the -- INSERT -- on the command line
set noshowmode

" ale - always keep gutter sign columns
let g:ale_sign_column_always = 1

" ------------------------------------------------------------
" Matsie's Autocomplete
" ------------------------------------------------------------

set omnifunc=syntaxcomplete#Complete
inoremap <lt>/ </<C-X><C-O>

" ------------------------------------------------------------
" Syntastic
" ------------------------------------------------------------

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_debug = 1

" ------------------------------------------------------------
" Syntastic Coffeescript
" ------------------------------------------------------------
au BufRead,BufNewFile *.coffee set filetype=coffee
let g:syntastic_coffee_checkers = ['coffee', 'coffeelint']
" let g:syntastic_coffee_coffeelint_args = "--reporter csv"
