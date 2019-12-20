call plug#begin('~/.local/share/nvim/plugged')

Plug 'andrewradev/sideways.vim'
Plug 'bazelbuild/vim-bazel'
Plug 'bfrg/vim-cpp-modern'
Plug 'brooth/far.vim'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json'
Plug 'francoiscabrol/ranger.vim'
Plug 'gfontenot/vim-xcode'
Plug 'google/vim-maktaba'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'keith/swift.vim'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-sandwich'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'pearofducks/ansible-vim'
Plug 'raimondi/delimitmate'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

set autoindent
set autowrite
set backspace=indent,eol,start
set cmdheight=2
set completeopt-=preview
set cursorline
set expandtab
set foldlevel=1
set foldmethod=syntax
set foldnestmax=1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set mouse=a
set shiftwidth=4
set shortmess+=c
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set ttimeoutlen=50
set updatetime=300

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
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap gb :Buffers<CR>
noremap gt g]
nnoremap <leader>l :NERDTreeToggle<CR>
nnoremap <leader>cs :CocSearch<Space>
nnoremap <leader>cc :CocCommand<CR>
nnoremap <leader>tb :Vista!!<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
vnoremap <C-C> "+y
nnoremap <leader>H :SidewaysLeft<cr>
nnoremap <leader>L :SidewaysRight<cr>

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

"To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'


"set background=dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

hi LineNr ctermbg=black ctermfg=235
hi Search term=reverse ctermbg=234 ctermfg=green
hi IncSearch term=reverse ctermbg=238 ctermfg=green
hi VertSplit ctermbg=235 ctermfg=black
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

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#vista#enabled=1
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
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


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

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:python3_host_prog = '/usr/local/bin/python3'

nnoremap <leader>rc :vsp $MYVIMRC<CR>

augroup TerminalStuff
   au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

let g:ale_linters = {
\   '*' : ['remove_traiilng_lines', 'trim_whitespace'],
\}
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

nnoremap <leader>al :ALELint<CR>

" Grepper
nnoremap <leader>g :Grepper -tool rg -highlight<CR>

runtime plugin/grepper.vim
let g:grepper.prompt_text = '$t> '

" Ranger
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>f :Ranger<CR>
