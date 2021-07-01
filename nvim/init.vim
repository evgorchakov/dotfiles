lua <<EOF
require('packer').startup(function()
    use {'Iron-E/nvim-highlite'}
    use {'christoomey/vim-tmux-navigator'}
    use {'elzr/vim-json'}
    use {'folke/lsp-colors.nvim'}
    use {'folke/tokyonight.nvim'}
    use {'folke/trouble.nvim'}
    use {'folke/zen-mode.nvim'}
    use {'google/protobuf'}
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'junegunn/vim-easy-align'}
    use {'liuchengxu/space-vim-dark'}
    use {'machakann/vim-sandwich'}
    use {'mbbill/undotree'}
    use {'mhinz/vim-startify'}
    use {'neovim/nvim-lsp'}
    use {'nvim-lua/completion-nvim'}
    use {'nvim-lua/lsp-status.nvim'}
    use {'nvim-lua/lsp_extensions.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/telescope.nvim'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'preservim/nerdtree'}
    use {'raimondi/delimitmate'}
    use {'reedes/vim-lexical'}
    use {'reedes/vim-litecorrect'}
    use {'reedes/vim-pencil'}
    use {'rust-lang/rust.vim'}
    use {'ryanoasis/vim-devicons'}
    use {'scrooloose/nerdcommenter'}
    use {'stephpy/vim-yaml'}
    use {'stevearc/aerial.nvim'}
    use {'tpope/vim-abolish'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-markdown'}
    use {'tpope/vim-sensible'}
    use {'tpope/vim-surround'}
    use {'vimwiki/vimwiki'}
    use {'wbthomason/packer.nvim'}
end)

local lsp_status = require'lsp-status'
lsp_status.config({
    indicator_errors = 'E',
    indicator_warnings = 'W',
    indicator_info = 'I',
    indicator_hint = '?',
    indicator_ok = 'Ok',
    diagnostics = true,
})
lsp_status.register_progress()

local lspconfig = require'lspconfig'

local on_attach = function(client)
    require'aerial'.on_attach(client)
    require'completion'.on_attach(client)
    require'lsp-status'.on_attach(client)
end

lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})

lspconfig.pyls.setup{
    on_attach=on_attach,
    capabilities=lsp_status.capabilities,
    settings = {
        pyls = {
          plugins = {
            pycodestyle = { 
                enabled = true; 
                maxLineLength = 88;
                ignore = {"E501"};
            };
            pyflakes = { enabled = true; };
            isort = { enabled = true; };
            yapf = { enabled = false; };
            autopep8 = { enabled = false; };
          };
        };
      };
}

lspconfig.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities=lsp_status.capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "crate",
                importPrefix = "plain",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

lspconfig.yamlls.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
        spacing = 4,
    },
    signs = true,
    update_in_insert = false,
    severity_sort = true,
  }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "rust"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = false,              -- false will disable the whole extension
  },
}

require('telescope').setup{}

-- colorscheme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_terminal_colors = false
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_sidebars = { "qf", "terminal", "packer" }
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.cmd[[colorscheme tokyonight]]


require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    section_separators = '', 
    component_separators = '',
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {{'mode', lower = true}},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {lsp_status.status},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = { },
  extensions = {"fugitive", "nerdtree", "quickfix"}
}


require'zen-mode'.setup({
    window = {
        backdrop = 1.0,
        height = 0.9,
        options = {
            signcolumn = "no",
            cursorline = false,
            number = false,
        }
    }
})

require'gitsigns'.setup()

EOF

filetype plugin indent on

set background=dark
set termguicolors
set autoindent
set autowrite
set clipboard+=unnamedplus
set cmdheight=2
set cursorline
set expandtab
set foldlevel=1
set foldmethod=syntax
set foldnestmax=1
set hidden
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set mouse=a
set number
set shiftwidth=4 
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=4 
set tabstop=4 
set tags=./tags;
set ttimeoutlen=50
set updatetime=300
set showtabline=2
set guioptions-=e

let delimitmate_expand_cr=1
let delimitmate_expand_space=1
let mapleader="\<Space>"

noremap : ;
noremap ; :
nnoremap <leader>q :nohlsearch<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>ts <cmd>Telescope<cr>
nnoremap <leader>o <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bnext<cr>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bprevious<cr>
nnoremap <leader>rc :vsp $MYVIMRC<cr>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"vimwiki
let g:vimwiki_list = [{'path':'~/notes'}]

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'chatette': { 'left': '//', 'leftAlt': '//'}  }

autocmd Filetype rust,python,go,c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4


nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent>gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent>K  <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent>gs <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent>gt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent>g0 <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent>gW <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>f  <cmd>lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>d  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>

imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

set completeopt=menuone,noinsert,noselect
set shortmess+=c

let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_paren = 1
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1

nnoremap <leader>l :NERDTreeToggle<cr>

au BufnewFile,BufRead *.chatette set ft=chatette

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
