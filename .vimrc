call plug#begin('~/.vim/plugged')
Plug 'roosta/vim-srcery'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhartington/oceanic-next'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-rails'
Plug 'flazz/vim-colorschemes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-obsession'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'tpope/vim-endwise'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'matze/vim-move'
Plug 'carlitux/deoplete-ternjs'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-bundler'
Plug 'prettier/vim-prettier'
Plug 'misterbuckley/vim-definitive'
call plug#end()

set notermguicolors

syntax enable
syntax on
filetype plugin indent on
colorscheme srcery
set clipboard =unnamed
set autoread
set background=dark
set number
set autoindent " Copy indent from current line when starting a new line
set smarttab
set tabstop=2 " Number of space og a <Tab> character
set softtabstop=2
set shiftwidth=2 " Number of spaces use by autoindent
set expandtab " Pressing <Tab> puts spaces, and < and > for indenting uses psaces
set nobackup
set noswapfile
set visualbell
set noerrorbells
set guifont=DroidSansMonoPLNerd:h12
set synmaxcol=128
set lazyredraw
set foldmethod=indent
set foldlevel=99
let mapleader=","
map <silent> <space>h <C-W>h
map <silent> <space>j <C-W>j
map <silent> <space>k <C-W>k
map <silent> <space>l <C-W>l

syntax sync minlines=256

"================PRETTIER====================
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:prettier#autoformat = 0
"============================================

"let g:srcery_inverse= 1
"===================================================="
"
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1
"let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"==================================================="
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'
let g:vim_jsx_pretty_colorful_config = 1

function! OpenPR()
  let current_branch = system('git rev-parse --abbrev-ref HEAD')
  execute '!open' . " " . "https://github.com/Thinkei/employment-hero/pull/" . current_branch
endfunction

function! CreatePR(root)
  let current_branch = system('git rev-parse --abbrev-ref HEAD')
  execute '!open' . " " . "https://github.com/Thinkei/employment-hero/compare/" . a:root . "..." . current_branch
endfunction

function! CreatePRFrontEnd(root)
  let current_branch = system('git rev-parse --abbrev-ref HEAD')
  execute '!open' . " " . "https://github.com/Thinkei/frontend-core/compare/" . a:root . "..." . current_branch
endfunction

function! RunCustom()
  execute ':e ~/.config/nvim/init.vim'
endfunction

nnoremap <Esc> :noh<CR><Esc>
noremap <silent> <F4> :let @+=expand("%:p")<CR>
noremap <leader>m :NERDTreeToggle<CR>
noremap <Space><Space> :w!<CR>
noremap <Space>q :q<CR>
noremap <Space>c :call RunCustom()<CR>
noremap <leader>f :FZF<CR>
noremap <leader>a :Ag<CR>
noremap <leader>w :Ag <<<<<CR>
inoremap jj <ESC>
autocmd! BufWritePost .config/nvim/init.vim source %
autocmd BufWritePre * StripWhitespace
autocmd! BufWritePost,BufEnter * Neomake
map <leader>s :call CreatePR("sandbox/payroll")<CR>
map <leader>d :call CreatePR("development")<CR>
map <leader>e :call CreatePRFrontEnd("master")<CR>
map <leader>o :call OpenPR()<CR>
map <leader>r :NERDTreeFind<cr>
map <leader>t :%!expand -t2<cr>
map <leader>c :e ~/.config/nvim/init.vim<cr>
nnoremap <space>d :FindDefinition<CR>
noremap <Space>t :tabedit %<CR>

" Run current cucumber scenario
"========================================================
" CONFIG Cucumber
"========================================================
let test#strategy = "neovim"
map <leader>tt :TestFile<CR>
map <leader>ts :TestNearest<CR>
map <leader>tl :TestLast<CR>
map <leader>ta :TestSuite<CR>
"========================================================
" CONFIG NEOMAKE
"========================================================
let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:neomake_ruby_enabled_makers = ['rubocop']
"========================================================
" CONFIG AIRLINE THEME
"========================================================
let g:airline#extensions#branch#format = 0
let g:airline_theme='powerlineish'
let g:oceanic_next_terminal_bold = 1
let g:move_key_modifier= 'C'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⭔'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'z', 'error', 'warning' ]]
