" ------------------------------------------------------------
" dein
" ------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

if &compatible
	set nocompatible            " be iMproved
endif
set runtimepath+=~/.config/nvim/dein.vim

if $TERM =~ 'linux'
  let g:airline_powerline_fonts = 0
  let g:airline_theme = 'base16_ocean'
else
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'nord'
endif

if dein#load_state('~/.config/nvim/dein')
	call dein#begin('~/.config/nvim/dein')

  call dein#add('~/.config/nvim/dein.vim')

  " Completion
  call dein#add('Shougo/deoplete.nvim')

  " Asynchronous linter
  call dein#add('w0rp/ale')

  " AsyncRun
  call dein#add('skywind3000/asyncrun.vim')

  " Ruby
  call dein#add('vim-ruby/vim-ruby', {'on_ft': ['ruby', 'cucumber']})
  call dein#add('Shougo/deoplete-rct', {'on_ft': ['ruby', 'cucumber']})

  " Nerdtree
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " Comments
  call dein#add('scrooloose/nerdcommenter')

  " Git
  call dein#add('tpope/vim-fugitive')

  " Ansible
  "call dein#add('pearofducks/ansible-vim', {'lazy': 1, 'on_ft': ['ansible', 'ansible_hosts', 'ansible_template', 'yaml.ansible', 'ruby.jinja2']})
  call dein#add('chase/vim-ansible-yaml', {'on_ft': ['ansible', 'ansible_hosts', 'ansible_template', 'yaml.ansible', 'ruby.jinja2']})

  " Looks
 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('arcticicestudio/nord-vim')

  " xterm-color-table: provides command :XtermColorTable
  call dein#add('guns/xterm-color-table.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" call dein#install() if there are any plugins not installed yet
if dein#check_install()
	call dein#install()
endif

" Don't wait for Python
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" activate deoplete
let g:deoplete#enable_at_startup = 1

set number              " Show the line numbers on the left side.

" set theme
if $TERM !~ 'linux'
  colorscheme nord
endif

" darvs-patch colorscheme
highlight LineNr ctermfg=08
highlight ErrorMsg ctermfg=15 ctermbg=88 guifg=#00FF00 guibg=#BF616A

" remove the -- INSERT -- on the command line
set noshowmode

" Disable auto paren matching
"let g:loaded_matchparen = 1
set matchtime=0
"set noshowmatch
hi MatchParen cterm=none ctermbg=88 ctermfg=white

" ale - always keep gutter sign columns
let g:ale_sign_column_always = 1

" ------------------------------------------------------------
" Global config
" ------------------------------------------------------------

let mapleader="\\"

" ------------------------------------------------------------
" AsyncRun
" ------------------------------------------------------------

let g:asyncrun_rootmarks = ['features']
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" ------------------------------------------------------------
" Ruby
" ------------------------------------------------------------

nmap b :AsyncRun -cwd=<root> cucumber<CR>

" ------------------------------------------------------------
" Mouse
" ------------------------------------------------------------
" Mouse activated in command mode only
" see :help mouse

set mouse=c

" ------------------------------------------------------------
" Nerdtree
" ------------------------------------------------------------
" https://github.com/scrooloose/nerdtree
" Good advice on https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9

nmap n          :NERDTreeToggle<CR>

" Quit on Open
let NERDTreeQuitOnOpen = 1

" Directory arrows
let NERDTreeDirArrows = 1

" Disable 'Press ? for Help'
" let NERDTreeMinimalUI = 1


" Open nerdtree if vim is loaded without a file name
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open nerdtree if vim is loaded with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Symbols for nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ------------------------------------------------------------
" NERDCommenter
" ------------------------------------------------------------

" unmap c in visual mode because it breaks everything
" by _c_hanging text (deleting and switching to insert mode)

vmap c <Nop>
vmap <leader><Space> <Plug>NERDCommenterToggle

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
"
"
source ~/.config/nvim/vimrc.common
