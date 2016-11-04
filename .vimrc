call plug#begin('~/.vim/plugged')
Plug 'roosta/vim-srcery'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf'
Plug 'mhartington/oceanic-next'
Plug 'junegunn/fzf.vim'
"Plug 'elzr/vim-json'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-rails'
Plug 'flazz/vim-colorschemes'
"Plug 'vim-ruby/vim-ruby'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
"Plug 'rking/ag.vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-endwise'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'mbbill/undotree'
"Plug 'Shougo/neosnippet'
"Plug 'fatih/vim-go'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'elixir-lang/vim-elixir'
"Plug 'thinca/vim-ref'
"Plug 'mhinz/vim-hugefile'
Plug 'ryanoasis/vim-devicons'
"Plug 'tpope/vim-dispatch'
"Plug 'radenling/vim-dispatch-neovim'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'matze/vim-move'
Plug 'carlitux/deoplete-ternjs'
"Plug 'sheerun/vim-polyglot'
"Plug 'floobits/floobits-neovim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
Plug 'KabbAmine/vCoolor.vim'
"Plug 'alvan/vim-closetag'
"Plug 'mattn/emmet-vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'kchmck/vim-coffee-script'
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
"clear hightligth search:
nnoremap <Esc> :noh<CR><Esc>
autocmd! bufwritepost .vimrc source %
if (has("termguicolors"))
  set termguicolors
endif
autocmd! BufWritePost * Neomake
let mapleader=","
noremap <silent> <F4> :let @+=expand("%:p")<CR>
syntax enable
"colorscheme OceanicNext
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
let g:srcery_inverse= 1
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
let g:neomake_ruby_enabled_makers = ['rubocop']
"let g:neomake_error_sign = {'text': '💧 ', 'texthl': 'NeomakeWarningMsg'}
"let g:neomake_warning_sign = {'text': '💧 ', 'texthl': 'NeomakeErrorMsg'}
"========================================================
" CONFIG AIRLINE THEME
"========================================================
let g:airline#extensions#branch#format = 0
let g:airline_theme='powerlineish'
let g:move_key_modifier = 'C'
let g:oceanic_next_terminal_italic = 1
let g:oceanic_next_terminal_bold = 1
 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_left_sep = '⭔'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'z', 'error', 'warning' ]
      \
