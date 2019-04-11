call plug#begin()
" YCM plugin
Plug 'Valloric/YouCompleteMe'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" colortheme gruvbox
Plug 'morhetz/gruvbox'
" HTML editing
Plug 'sukima/xmledit/'
" Linting
Plug 'w0rp/ale'
" Airline
Plug 'vim-airline/vim-airline'
" Nerdtree
Plug 'scrooloose/nerdtree'
" Jedi
Plug 'davidhalter/jedi-vim', { 'do': 'pip install jedi' }
" Nerd Comment
Plug 'scrooloose/nerdcommenter'
" Autopairs
Plug 'jiangmiao/auto-pairs'
" IncSearch
Plug 'haya14busa/incsearch.vim'
call plug#end()

colorscheme gruvbox
"set background=dark

" Disable Jedi autocomplete
let g:jedi#completions_enabled = 0

set hidden
set mouse=a
set encoding=utf-8

" Set leader key
let mapleader="\<space>"

" Bind terminal creation on current window
nnoremap <leader>t :term ++curwin<cr>
" Bind window resizing
nnoremap <silent> <C-Right> <c-w><s->>
nnoremap <silent> <C-Left> <c-w><s-<>
nnoremap <silent> <C-Up> <c-w>+
nnoremap <silent> <C-Down> <c-w>-
" Bind buffer switching
nnoremap <leader>b :ls<cr>:b<space>
" Bind :bn and :bp
nnoremap <C-PageUp> :bp<cr>
nnoremap <C-PageDown> :bn<cr>
" Bind NERDTree
nnoremap <leader>q :NERDTree<cr>
" Ignore terminal buffers on :ls, :bn and :bp
autocmd TerminalOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif
" Prevent window closing on :bd
command Bd bp | sp | bn | bd
nnoremap <C-Del> :Bd<cr>

" Maximize screen on startup (Windows)
au GUIEnter * simalt ~x
" Enable Fullscreen on F11 (Windows)
map <F11> <Esc>:call libcallnr("gvimfullscreen_64.dll", "ToggleFullScreen", 0)<CR>
" Remove unecessary scrollbar (Windows)
au VimEnter * set go-=r
au VimEnter * set go-=L

" Display line and column number in bottom ruler.
set ruler

" Display the line numbers.
set number
set relativenumber

" Activate syntax highlighting.
filetype on
syntax enable

" Remove beep sounds
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

if has("gui_running")
  " Set a nicer font.
  set guifont=Consolas:h14:cDEFAULT
  " Hide the toolbar.
  set guioptions-=T
endif

" set powershell as default terminal (Windows)
set shell=powershell.exe
" set working dir to home
cd ~/

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Setting Ale Fixers
let g:ale_fixers = {
\'python' : ['autopep8','isort','yapf'],
\'javascript': ['eslint'],
\'css' : ['stylelint'],
\'*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Ale auto fix on save
let g:ale_fix_on_save = 1

" Set split to bottom and right
set splitbelow
set splitright

" Incsearch settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" Set smart case sensitive search and substitution
set ignorecase
set smartcase

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Django recommended settings for YCM
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Recommended settings for ultisnipts to work with YCM
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
