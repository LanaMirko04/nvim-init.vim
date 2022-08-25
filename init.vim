call plug#begin()

" Core (treesitter, telescope, lualine, etc...)Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Functionalities
Plug 'alvan/vim-closetag'

" UI - Coloscheme
Plug 'morhetz/gruvbox'

" UI - Other
Plug 'startup-nvim/startup.nvim'

call plug#end()

set nocompatible
set encoding=utf-8
filetype plugin indent on
syntax on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent 
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set cursorline laststatus=2 showcmd showmode
set relativenumber
set title
set ttyfast

color gruvbox
set termguicolors

" Core plugin configuration (lua)
lua << EOF
servers = {
  'clangd',
	'html',
	'cssls',
	'phpactor',
}

require('lspconfig-config')
require('nvim-cmp-config')
require('telescope-config')
require('toggleterm-config')
require('lualine-config')
require('nvim-tree-config')
require('startup').setup({ theme = "dragon" })
EOF

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" nvim-cmp
set completeopt=menu,menuone,noselect


" Core
nmap <C-t> :ToggleTerm<CR>
nmap <Space>t :NvimTreeToggle<CR>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Telescope mappings
nnoremap <Space>ff <cmd>Telescope find_files<cr>
nnoremap <Space>fg <cmd>Telescope live_grep<cr>
nnoremap <Space>fb <cmd>Telescope buffers<cr>
nnoremap <Space>fh <cmd>Telescope help_tags<cr>
nnoremap <Space>fc <cmd>Telescope colorscheme<cr>
nnoremap <Space>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>
