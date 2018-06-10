" ------------------------------------------------------------
" dein
" ------------------------------------------------------------

set nocompatible		" be iMproved, required
filetype off			" required

if &compatible
	set nocompatible	" be iMproved
endif
set runtimepath+=~/.config/nvim/dein.vim

if $TERM =~ 'linux'
	let g:airline_powerline_fonts = 0
else
	let g:airline_powerline_fonts = 1
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

	" Go
	call dein#add('fatih/vim-go', {'on_ft': 'go', 'do': ':GoInstallBinaries'})

	" Ruby
	call dein#add('vim-ruby/vim-ruby', {'on_ft': ['ruby', 'cucumber']})
	call dein#add('Shougo/deoplete-rct', {'on_ft': ['ruby', 'cucumber']})

	" Systemd
	call dein#add('Matt-Deacalion/vim-systemd-syntax', {'on_ft': 'systemd'})

	" Nerdtree
	call dein#add('scrooloose/nerdtree')
	call dein#add('Xuyuanp/nerdtree-git-plugin')

	" Comments
	call dein#add('scrooloose/nerdcommenter')

	" Git
	call dein#add('tpope/vim-fugitive')

	" Diff
	call dein#add('rickhowe/diffchar.vim')

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
	normal UpdateRemotePlugins
endif

" Don't wait for Python
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" activate deoplete
let g:deoplete#enable_at_startup = 1

set number              " Show the line numbers on the left side.

" set theme
let g:airline_theme = 'nord'
colorscheme nord

" darvs-patch colorscheme
highlight LineNr ctermfg=08
highlight ErrorMsg ctermfg=15 ctermbg=88 guifg=#00FF00 guibg=#BF616A

" remove the -- INSERT -- on the command line
set noshowmode

" Disable auto paren matching
"let g:loaded_matchparen = 1
set matchtime=0
"set noshowmatch
highlight MatchParen cterm=none ctermbg=88 ctermfg=white

" ------------------------------------------------------------
" Global config
" ------------------------------------------------------------

let mapleader="\\"

" ------------------------------------------------------------
" Ale
" ------------------------------------------------------------

" Always keep gutter sign columns
let g:ale_sign_column_always = 1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" ------------------------------------------------------------
" AsyncRun
" ------------------------------------------------------------

let g:asyncrun_rootmarks = ['features']
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

" ------------------------------------------------------------
" Ruby
" ------------------------------------------------------------

augroup ruby_mappings
	autocmd!
	autocmd FileType ruby,cucumber nmap <buffer> b :AsyncRun -cwd=<root> cucumber<CR>
augroup END

" ------------------------------------------------------------
" Go
" ------------------------------------------------------------

augroup go_mappings
	autocmd!
	autocmd FileType go nmap <buffer> b :GoBuild<CR>
	autocmd FileType go nmap <buffer> <leader>b :GoBuild<CR>
	autocmd FileType go nmap <buffer> <leader>i :GoInstall<CR>

	" TABS
	autocmd FileType go set noexpandtab
	autocmd FileType go set shiftwidth=4
	autocmd FileType go set softtabstop=4
	autocmd FileType go set tabstop=4

	" Highlights
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_types = 1

	" Highlight same id
	let g:go_auto_sameids = 1

	" Add imports on format
	let g:go_fmt_command = "goimports"

	" Show variable type
	let g:go_auto_type_info = 1
augroup END

" ------------------------------------------------------------
" Diff
" ------------------------------------------------------------

augroup diff
	autocmd!
	autocmd FilterWritePre * if &diff | setlocal wrap linebreak nolist | endif

	set diffopt+=vertical

	highlight DiffChange cterm=bold ctermfg=yellow
	highlight DiffText cterm=none ctermbg=yellow ctermfg=black
augroup END

" ------------------------------------------------------------
" Markdown
" ------------------------------------------------------------

augroup markdown
	autocmd!
	autocmd FileType markdown setlocal wrap linebreak nolist
	autocmd FileType markdown call SetBufferWrapCursor()
	" Remove the trailing whitespace check
	autocmd FileType markdown let b:airline_whitespace_checks = ['indent']
	autocmd FileType markdown setlocal list
	autocmd FileType markdown setlocal listchars=trail:•

	" Disable deoplete
	autocmd FileType markdown let b:deoplete_disable_auto_complete=1
augroup END

function! SetBufferWrapCursor()
	nnoremap <buffer> j gj
	nnoremap <buffer> k gk
	vnoremap <buffer> j gj
	vnoremap <buffer> k gk
	nnoremap <buffer> <Down> gj
	nnoremap <buffer> <Up> gk
	vnoremap <buffer> <Down> gj
	vnoremap <buffer> <Up> gk
	inoremap <buffer> <Down> <C-o>gj
	inoremap <buffer> <Up> <C-o>gk
endfunction

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
" ------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------
"map <C-p>	 :bprevious<CR>
"map <C-n>	 :bnext<CR>

"nmap [ 	:bprevious<CR>
"nmap ]		:bnext<CR>
nmap <C-left>	:bp<CR>
nmap <C-right>	:bn<CR>
nmap <C-up>	<C-w><up>
nmap <C-down>	<C-w><down>

" ------------------------------------------------------------
" Allow modelines, screw debian
" ------------------------------------------------------------

set modeline
set modelines=5

" ------------------------------------------------------------
" Disable auto-continue comment, that screws with cut & paste
" ------------------------------------------------------------

autocmd FileType * setlocal formatoptions-=r

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
" airline
" ------------------------------------------------------------
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Fix a problem where the space is not wide enough
let g:airline_symbols.space = "\ua0"

if $NERD != 'on'
	" unicode symbols
	"let g:airline_left_sep = '▶'
	"let g:airline_right_sep = '◀'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.branch = '⎇'
	"" let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.whitespace = 'Ξ'
	let g:airline_symbols.linenr = '#'
	let g:airline_symbols.maxlinenr = ''
	let g:airline_symbols.readonly = 'ro'
endif

if $TERM == 'linux'
	let g:airline_symbols.branch = ''
endif
