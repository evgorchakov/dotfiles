call plug#begin('~/.local/share/nvim/plugged')
Plug 'Iron-E/nvim-highlite'
Plug 'google/protobuf'
Plug 'bfrg/vim-cpp-modern'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', {'commit': '2115cae' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'liuchengxu/space-vim-dark'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-sandwich'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'neovim/nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'raimondi/delimitmate'
Plug 'rbgrouleff/bclose.vim'
Plug 'rbong/vim-crystalline'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'stephpy/vim-yaml'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vhdirk/vim-cmake'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'
call plug#end()

filetype plugin indent on

set background=dark
colorscheme space-vim-dark
set termguicolors

hi Normal ctermbg=NONE guibg=NONE
hi Comment cterm=italic
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

set autoindent
set autowrite
set clipboard+=unnamedplus
set cmdheight=2
set cursorline
set expandtab
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


let delimitmate_expand_cr=1
let delimitmate_expand_space=1
let mapleader="\<Space>"
let g:fzf_buffers_jump=1
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_motion_matchparen=0

noremap : ;
noremap ; :
nnoremap <leader>q :nohlsearch<cr>
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>o <cmd>Telescope find_files<cr>
" nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>g <cmd>Rg<cr>
nnoremap <leader>h :History:<cr>
nnoremap <leader>tt :Tags<cr>
nnoremap <leader>bt :Vista finder<cr>
nnoremap <leader>/ :BLines<cr>
nnoremap gb :Buffers<cr>
noremap gt g]
nnoremap <leader>tb :Vista!!<cr>
nnoremap tn :tabnext<cr>
nnoremap tp :tabprev<cr>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bnext<cr>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <cr> :write<cr> :endif<cr>:bprevious<cr>
vnoremap <C-C> "+y
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
"To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
nnoremap <leader>rc :vsp $MYVIMRC<cr>

au BufnewFile,BufRead *.tex set ft=tex
au FileType tex,plaintex set spelllang=en_us spell
au FileType tex noremap <Leader>ll :VimtexCompile<cr>
au FileType tex noremap <Leader>c :VimtexClean<cr>
au FileType tex noremap <Leader>lv :VimtexView<cr>
au FileType tex noremap <Leader>wc :VimtexCountWords<cr>
au FileType tex noremap <Leader>e :VimtexErrors<cr>


let g:signify_realtime = 1
hi SignifySignAdd    ctermbg=black  ctermfg=119
hi SignifySignDelete ctermbg=black  ctermfg=167
hi SignifySignChange ctermbg=black  ctermfg=227


" Use K to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<cr>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

augroup TerminalStuff
   au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    "let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %l/%L %cV '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 0
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'badwolf'

set showtabline=2
set guioptions-=e

"vimwiki
let g:vimwiki_list = [{'path':'~/notes'}]

func! WritingMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    setlocal nocursorline 
    set complete="
    setlocal wrap
    setlocal linebreak

    call pencil#init({'wrap': 'soft'})
    call lexical#init()
    call litecorrect#init()

    " manual reformatting shortcuts
    nnoremap <buffer> <silent> Q gqap
    xnoremap <buffer> <silent> Q gq
    nnoremap <buffer> <silent> <leader>Q vapJgqap

    " force top correction on most recent misspelling
    nnoremap <buffer> <c-s> [s1z=<c-o>
    inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

    " replace common punctuation
    iabbrev <buffer> -- –
    iabbrev <buffer> --- —
    iabbrev <buffer> << «
    iabbrev <buffer> >> »

    " open most folds
    setlocal foldlevel=6
    :Goyo 90
endfunction

command! -nargs=0 WritingMode call WritingMode()

"pandoc
let g:pandoc#command#autoexec_on_writes = 1
" let g:pandoc#command#autoexec_command = "Pandoc! pdf"

let g:vista_default_executive='nvim_lsp'
let g:vista_sidebar_width=50

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'chatette': { 'left': '//', 'leftAlt': '//'}  }

lua <<EOF
local on_attach = function(client)
    require('completion').on_attach(client)
end

require('lspconfig').clangd.setup{
    capabilities = {
     textDocument = {
       completion = {
         completionItem = {
           snippetSupport = true
         }
       }
     }
    },
    on_attach=on_attach,
}

require('lspconfig').pyls.setup{
    capabilities = {
     textDocument = {
       completion = {
         completionItem = {
           snippetSupport = true
         }
       }
     }
    },
    on_attach = on_attach,
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
require('lspconfig').rust_analyzer.setup{on_attach=on_attach}
require('lspconfig').yamlls.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
    virtual_text = {
        spacing = 10,
    },
    signs = false,
    update_in_insert = true,
  }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = false,              -- false will disable the whole extension
  },
}

require('telescope').setup{}

EOF

autocmd Filetype rust,python,go,c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <leader>ff    <cmd>lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>rn    <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>ss :ClangdSwitchSourceHeader<cr>

let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_paren = 1
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1

nnoremap <leader>l :NERDTreeToggle<cr>

au BufnewFile,BufRead *.chatette set ft=chatette
