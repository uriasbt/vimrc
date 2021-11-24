" ----------------------------------
" ########## BASIC SETTINGS

syntax enable
filetype plugin on
" search down into subsfolders and provides tab-competion for all file-related tasks
set path+=**
" display all matching files when we tab complete
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set wildmenu
set linespace=6
set nowrap
set nu
set hlsearch
set clipboard=unnamed,unnamedplus
set nocompatible
set noexpandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set undodir=c:\tools\vim\
set incsearch
set showmatch
set laststatus=2
set noshowmode
set backspace=indent,eol,start
set notermguicolors
set t_Co=256
if &term =~ '256color'
    set t_ut=
endif

let g:polyglot_disabled = ['markdown']

" ----------------------------------
" ########## PLUGINS

call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
Plug 'jelera/vim-javascript-syntax'

" php
Plug 'stephpy/vim-php-cs-fixer'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" check out https://thevaluable.dev/vim-php-ide/ for a helpfull guide
" deoplete
" if has('nvim')
"	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"	Plug 'Shougo/deoplete.nvim'
"	Plug 'roxma/nvim-yarp'
"	Plug 'roxma/vim-hug-neovim-rpc'
"endif

call plug#end()

" ----------------------------------
" ########## indentLine

let g:indentLine_defaultGroup = 'VertSplit'

" ----------------------------------
" ########## Coc

" :CocInstall coc-phpls
let g:coc_global_extensions = ['coc-tsserver','coc-json','coc-html','coc-css','coc-phpls','coc-python','coc-diagnostic']

" ----------------------------------
" ########## NERDTree

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" ----------------------------------
" ########## THEME

set guifont=Roboto\ Mono\ Regular\ 11
" colorscheme blinding
colorscheme rorvswild
"let g:airline_theme='blinding'
let g:airline_theme='rorvswild'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" ----------------------------------
" ########## NERDTree

" autocmd VimEnter * NERDTree | wincmd p " start NERDTree and put the cursor back in the other window.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif " Exit Vim if NERDTree is the only window remaining in the only tab.
let NERDTreeMinimalUI=1

" ----------------------------------
" ########## THEME DEV

" Show curent cursor hightlight group
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

noremap m :call SynGroup()<CR>

" ----------------------------------
" ########## KEY MAPPING

nnoremap <C-p> :Files<CR>
nmap <C-b> :TagbarOpenAutoClose<CR>

" copy and paste to system clipboard when in visual mode
vnoremap <C-c> "*y

" paste from clipboard when in insert mode.
imap <C-v> <ESC>"+gpa
nmap <C-v> <ESC>"+gpa

" Paste from clipboard when in visual mode. (Replace whatever is selected in visual mode.)
vmap <C-v> "+gpi

" ctrl+s to saves file in any mode
" nnoremap <C-s> <ESC>:w!<CR>
" vnoremap <C-s> <ESC>:w!<CR>
" inoremap <C-s> <ESC>:w!<CR>

" ctrl+z to undo
" nnoremap <C-z> <ESC>:undo<CR>
" inoremap <C-z> <ESC>:undo<CR>

" backup vimrc
nnoremap <F12> <ESC>:w! d:\vim\vimrc.txt<CR>

nnoremap <C-e> <ESC>:NERDTreeToggle<CR>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" dupkicate selection
nnoremap <C-d> <ESC> Vy'>p

" ----------------------------------
" ########## STARTUP

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

:cd d:\host\var\www\
