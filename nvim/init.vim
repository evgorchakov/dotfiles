call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim' 
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next',  'do': 'bash install.sh' }
Plug 'chriskempson/base16-vim'
Plug 'dkprice/vim-easygrep'
Plug 'elzr/vim-json'
Plug 'gfontenot/vim-xcode'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/vim-easy-align' 
Plug 'keith/swift.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'pearofducks/ansible-vim'
Plug 'raimondi/delimitmate'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end() 
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set number
set incsearch
set smartcase
set ignorecase
set hlsearch
set mouse=a
set laststatus=2
set ttimeoutlen=50
set autoindent
set smartindent
set hidden
set cursorline
set lazyredraw
set autowrite
set completeopt-=preview
set foldmethod=indent
set foldlevel=1
set foldnestmax=1

set tags=./tags;

let delimitmate_expand_cr=1
let delimitmate_expand_space=1
let mapleader="\<Space>"

noremap : ;
noremap ; :
nnoremap <leader>q :nohlsearch<CR>
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>o :Files<CR>
nnoremap <leader>tt :Tags<CR>
nnoremap <leader>/ :Blines<CR>
nnoremap gb :Buffers<CR>
noremap gt g]
"nnoremap <leader>l :Lexplore<CR>
nnoremap <leader>l :NERDTreeToggle<CR>
nnoremap <leader>g :Rg 
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>al :ALELint<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
vnoremap <C-C> "+y

imap ` <Esc>
"Terminal
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>

"To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>lnoremap ` <C-\><C-n>

set backspace=indent,eol,start
imap <Bs> <Esc>

set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

hi LineNr ctermbg=black ctermfg=235
hi Search term=reverse ctermbg=234 ctermfg=green
hi IncSearch term=reverse ctermbg=238 ctermfg=green
hi VertSplit ctermbg=black ctermfg=235
hi Pmenu ctermbg=233 ctermfg=white
hi PmenuSel ctermbg=233 ctermfg=green
hi SignColumn ctermbg=black
hi Visual ctermbg=darkgrey
hi WildMenu ctermfg=black ctermbg=green
hi Normal ctermfg=250
hi SpellBad ctermfg=NONE
hi SpellCap ctermfg=NONE
hi MatchParen ctermbg=235 ctermfg=250
hi CursorLine ctermbg=NONE
hi CursorLineNR ctermbg=NONE ctermfg=245
hi cppOperator ctermfg=4 
hi Error ctermbg=NONE ctermfg=darkred
hi SpellCap ctermbg=darkgrey

let g:netrw_liststyle=3
let g:netrw_winsize=25
let g:netrw_banner=0
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browse_split=4
let g:netrw_list_hide='.git/,.*\.swp$,'
let g:netrw_hide=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#fnamemod=':t'
if !exists('g:airline_symbols')
    let g:airline_symbols={}
end
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_powerline_fonts=0
let g:airline_theme='serene'
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'z']
  \ ]


set rtp+=~/.fzf
let g:fzf_buffers_jump=1

let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_motion_matchparen=0
au BufnewFile,BufRead *.tex set ft=tex
au FileType tex,plaintex set spelllang=en_us spell
au FileType tex noremap <Leader>ll :VimtexCompile<CR>
au FileType tex noremap <Leader>c :VimtexClean<CR>
au FileType tex noremap <Leader>lv :VimtexView<CR>
au FileType tex noremap <Leader>wc :VimtexCountWords<CR>
au FileType tex noremap <Leader>e :VimtexErrors<CR>

func! WritingMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    set complete+=s
    setlocal wrap
    setlocal linebreak
endfu

nnoremap <leader>sf :SignifyFold<CR>
let g:signify_realtime = 1
hi SignifySignAdd    ctermbg=black  ctermfg=119
hi SignifySignDelete ctermbg=black  ctermfg=167
hi SignifySignChange ctermbg=black  ctermfg=227

let g:deoplete#enable_at_startup=1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#flags = ['-darwin=10.13' ]

let g:ale_cpp_clang_options='-std=c++17 -Wall'

let g:ale_linters = {
\    'python': ['pyls'],
\    'cpp': ['clang', 'cppclean', 'cppcheck' ],
\}

let g:ale_fixers = {
\    'python': ['black'],
\    'cpp': ['clang-format'],
\    'objc': ['clang-format'],
\    'objcpp': ['clang-format'],
\    'swift': ['swiftformat'],
\}
let g:ale_c_clangformat_options = '--style="{BasedOnStyle: LLVM, IndentWidth: 4}"'
let g:ale_python_black_options = '--fast'
let g:ale_python_pyls_auto_pipenv = 1

let g:polyglot_disabled = ['latex']

"go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>i  <Plug>(go-imports)
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1

autocmd FileType python nnoremap <leader>ds :Pydocstring<CR>  

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

nnoremap <silent><Leader>c :RangerOpenCurrentDir<CR>
nnoremap <silent><Leader>f :RangerOpenProjectRootDir<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1 

au FileType objcpp noremap <leader>b :Xbuild<CR>
let g:python3_host_prog = '/usr/local/bin/python3'

let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
\ 'swift':  ['~/.local/bin/sourcekit-lsp'],
\ 'cpp':    ['~/.local/bin/ccls', '-v=2', '--log-file=/tmp/cc.log'],
\ 'objc':   ['~/.local/bin/ccls', '-v=2', '--log-file=/tmp/cc.log'],
\ 'objcpp': ['~/.local/bin/ccls', '-v=2', '--log-file=/tmp/cc.log'],
\ 'python': ['/usr/local/bin/pyls'],
\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

nnoremap <leader>rc :vsp $MYVIMRC<CR>
