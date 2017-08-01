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
Plug 'ntpeters/vim-better-whitespace'
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
Plug 'mxw/vim-jsx'
Plug 'matze/vim-move'
Plug 'carlitux/deoplete-ternjs'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-bundler'
Plug 'vim-scripts/VimClojure'
"Plug 'mbbill/undotree'
"Plug 'KabbAmine/vCoolor.vim'
"Plug 'elzr/vim-json'
"Plug 'vim-ruby/vim-ruby'
"Plug 'rking/ag.vim'
"Plug 'Shougo/neosnippet'
"Plug 'fatih/vim-go'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'elixir-lang/vim-elixir'
"Plug 'thinca/vim-ref'
"Plug 'mhinz/vim-hugefile'
"Plug 'tpope/vim-dispatch'
"Plug 'radenling/vim-dispatch-neovim'
"Plug 'sheerun/vim-polyglot'
"Plug 'floobits/floobits-neovim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'alvan/vim-closetag'
"Plug 'mattn/emmet-vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
"Plug 'chriskempson/base16-vim'
if has('nvim')
  "Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
  "lug 'slashmili/alchemist.vim'
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
endif
call plug#end()
nnoremap <Esc> :noh<CR><Esc>
let mapleader=","
noremap <silent> <F4> :let @+=expand("%:p")<CR>
noremap <Leader>m :NERDTreeToggle<CR>
noremap <Leader>f :FZF<CR>
noremap <Leader>a :Ag<CR>
inoremap jj <ESC>
autocmd! BufWritePost .config/nvim/init.vim source %
autocmd BufWritePre * StripWhitespace
if (has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app' && $TERM !~# '^\%(screen\|tmux\)')
    set termguicolors
  else
    set notermguicolors
  endif
autocmd! BufWritePost,BufEnter * Neomake
"Remove all trailing whitespace by pressing F5
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
syntax sync minlines=256
"let g:srcery_inverse= 1
"====================================================:q
"
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
map <leader>r :NERDTreeFind<cr>

" Run current cucumber scenario
"========================================================
" CONFIG Cucumber
"========================================================
let test#strategy = "neovim"
map <Leader>tt :TestFile<CR>
map <Leader>ts :TestNearest<CR>
map <Leader>tl :TestLast<CR>
map <Leader>ta :TestSuite<CR>
"========================================================
" CONFIG NEOMAKE
"========================================================
let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:neomake_ruby_enabled_makers = ['rubocop']
"let g:neomake_error_sign = {'text': '💧', 'texthl': 'NeomakeWarningMsg'}
"let g:neomake_warning_sign = {'text': '💧', 'texthl': 'NeomakeErrorMsg'}
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
" Update ruby ctags
function! URT()
  return system('ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)')
endfunction
map <silent> <leader>urt <ESC>:call URT()<CR>
map <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), fzf#vim#layout(expand("<bang>0")))<cr>
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
"==============================================================
" CONFIG CLOJURE
"==============================================================
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
