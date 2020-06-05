call plug#begin('~/.local/share/nvim/plugged')

"Plug 'alok/notational-fzf-vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dkarter/bullets.vim'
Plug 'elzr/vim-json'
Plug 'francoiscabrol/ranger.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-sandwich'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'raimondi/delimitmate'
Plug 'rbgrouleff/bclose.vim'
Plug 'rbong/vim-crystalline'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'
Plug 'jackguo380/vim-lsp-cxx-highlight'
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
nnoremap <leader>bt :Vista finder<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap gb :Buffers<CR>
noremap gt g]
nnoremap <leader>l :NERDTreeToggle<CR>
nnoremap <leader>cs :CocSearch<Space>
nnoremap <leader>cm :CocCommand<CR>
nnoremap <leader>tb :Vista!!<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
vnoremap <C-C> "+y

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

"To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

set background=dark
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


let g:signify_realtime = 1
hi SignifySignAdd    ctermbg=black  ctermfg=119
hi SignifySignDelete ctermbg=black  ctermfg=167
hi SignifySignChange ctermbg=black  ctermfg=227

let g:polyglot_disabled = ['latex']

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

nnoremap <leader>rc :vsp $MYVIMRC<CR>

augroup TerminalStuff
   au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END


" Ranger
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
nnoremap <leader>r :Ranger<CR>

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

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'onedark'

set showtabline=2
set guioptions-=e
set laststatus=2

"vimwiki
let g:vimwiki_list = [{'path':'~/notes'}]

"notational
"let g:nv_search_paths = ['~/notes']

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
let g:pandoc#command#autoexec_command = "Pandoc! pdf" 

"grep
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <leader>g :RG 
nnoremap <silent> <leader>/ :call RipgrepFzf(expand('<cword>'), 0)<CR>

let g:vista_default_executive='coc'
