call plug#begin('~/.local/share/nvim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'elzr/vim-json'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align' 
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'raimondi/delimitmate'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim' 
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'

call plug#end()

set shiftwidth=4
set softtabstop=4
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

set tags=./tags;

let delimitmate_expand_cr=1
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
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lexplore<CR>
nnoremap <leader>g :Rg
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>af :ALEFix<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

vnoremap <C-C> "+y

set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

hi LineNr ctermbg=black ctermfg=235
hi Search term=reverse ctermbg=234 ctermfg=green
hi IncSearch term=reverse ctermbg=238 ctermfg=green
hi VertSplit ctermbg=black ctermfg=darkgrey
hi Pmenu ctermbg=233 ctermfg=white
hi PmenuSel ctermbg=233 ctermfg=green
hi SignColumn ctermbg=black
hi Visual ctermbg=235
hi WildMenu ctermfg=black ctermbg=green
hi Normal ctermfg=250
hi SpellBad ctermfg=NONE
hi SpellCap ctermfg=NONE
hi MatchParen ctermbg=235 ctermfg=250
hi CursorLine ctermbg=NONE
hi CursorLineNR ctermbg=NONE ctermfg=245

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
let g:airline_theme='term'
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
let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:ale_cpp_clang_options='-std=c++17 -Wall'

let g:ale_linters = {
\    'python': ['pylint'],
\    'cpp': ['clang', 'clang-tidy', 'clang-check'],
\}

let g:ale_fixers = {
\    'python': ['yapf'],
\    'cpp': ['clang-format'],
\}
let g:ale_c_clangformat_options = '--style="{BasedOnStyle: LLVM, IndentWidth: 4}"'

imap <expr> <CR> pumvisible() ? neocomplcache#smart_close_popup() : '<Plug>delimitMateCR'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:polyglot_disabled = ['latex']
