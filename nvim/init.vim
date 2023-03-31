call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'kdheepak/lazygit.nvim'
Plug 'nvie/vim-flake8'
Plug 'https://github.com/Yggdroot/indentLine' "Indent line indication
Plug 'https://github.com/terryma/vim-multiple-cursors' "CTRL + N for multiple cursors
Plug 'JuliaEditorSupport/julia-vim'
Plug 'https://github.com/vim-python/python-syntax' "Python syntax
Plug 'jiangmiao/auto-pairs' "Automatic bracket pairs
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'metakirby5/codi.vim'
Plug 'voldikss/vim-floaterm'
Plug 'windwp/vim-floaterm-repl'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'chipsenkbeil/distant.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lewis6991/gitsigns.nvim'
Plug 'luk400/vim-jukit'
call plug#end()

syntax on
"TAB and SPACES"
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set mouse=a
set colorcolumn=80
set fileformat=unix
set encoding=UTF-8

set autoindent

"FILE FIND"
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set hidden
set incsearch
set noswapfile

"UI"
set number
set relativenumber
set showmatch
set cursorline
set showcmd
set modelines=1
set nohlsearch
set scrolloff=8 
set signcolumn=yes
set clipboard=unnamedplus

"   set termguicolors
"   set background=dark 
"   let g:everforest_background = 'hard'
"   let g:everforest_transparent_background = 1
"   colorscheme everforest 

set termguicolors
set background=dark 
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material 

let mapleader = " "

nnoremap <leader>e :Lex 30<cr>
nnoremap <leader>v :e $MYVIMRC<cr>

let g:floaterm_keymap_new = '<Leader>tt'
let g:floaterm_keymap_toggle = '<A-m>'
let g:floaterm_position = 'bottom'
let g:floaterm_width = 0.99
let g:floaterm_height = 0.55

tnoremap <silent> <C-\> <C-\><C-n>
nnoremap <leader>p :FloatermNew ipython<cr>
nnoremap <leader>j :FloatermNew julia<cr>
vnoremap <A-r> :'<,'>FloatermRepl<cr>
vnoremap <A-s> :'<,'>FloatermSend<cr> :FloatermToggle<cr> 


"Better window navigation"
nnoremap <leader>1 <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <leader>2 <C-w>l

"vsc like commands"
noremap <A-j> :m .+1<cr>==
noremap <A-k> :m .-2<cr>==

noremap <A-C-j> yyp
noremap <A-C-k> yyP

vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

"Navigate buffers"
nnoremap <c-w> :bd<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>g :LazyGit<cr>
"copy to clipboard"
vnoremap  <leader>y  "+y

"For searching and replace /name <cr> cgn new_name <cr> <esc> ."


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Nvim-treesitter setup
lua << EOF
--require('gitsigns').setup()
require('tree-sitter-config')
require('lualine-config')
require('barbar-config')
require('mason-config')
require('lsp-config.language-servers')
require('lsp-config.completion')
require('lsp-config.null-ls')

--local palette = require('nightfox.palette').load('terafox')
--print(vim.inspect(palette))

EOF
