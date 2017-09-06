"HERE BE RUNTIME CONFIGURATION


"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'itchyny/lightline.vim'
"Bundle 'daviesjamie/vim-base16-lightline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'chriskempson/base16-vim'
Plugin 'elzr/vim-json'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'lervag/vimtex'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'mileszs/ack.vim'
Plugin 'klen/python-mode'
Plugin 'delimitMate.vim'
Plugin 'mhinz/vim-startify'
Plugin 'vimwiki/vimwiki'
Plugin 'petrushka/vim-opencl'
Plugin 'rhysd/vim-clang-format'

call vundle#end()
filetype plugin indent on

set encoding=utf-8


let mapleader="\<Space>"
"Spaces/Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

"UI
filetype indent on
syntax enable
set number
set showcmd
set nocursorline
set wildmenu
set ttyfast
set nolazyredraw
"set lazyredraw

"Search
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <leader>q :nohlsearch<CR>

"Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

"Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
noremap ; :
noremap : ;
set whichwrap+=<,>,h,l,[,]

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set mouse=a


"Color 
set background=dark
let base16colorspace=256
colorscheme base16-bright
hi LineNr ctermbg=black ctermfg=233 
hi ColorColumn ctermbg=232
hi SignColumn ctermbg=232

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
set laststatus=2
set showtabline=2
let g:airline_theme='behelit'


"NERDTree
noremap <C-n> :NERDTreeToggle<CR>

"Ctrlp
"
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_max_files=0
let g:ctrlp_cmd = 'CtrlPMixed'
"
"General
set autoindent
set backspace=indent,eol,start
set hidden
let delimitMate_expand_cr=2

"Misc
set exrc
set secure
"set colorcolumn=80
vnoremap <C-c> "+y

"Cursor shape in insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


"Navigation
nnoremap  <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"Table mode
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" R
inoremap <Nul> <C-x><C-o>
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command="goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>l <Plug>(go-metalinter)
au FileType go nmap <leader>i <Plug>(go-info)


"Ag
let g:ackprg = 'ag --vimgrep'
nnoremap <Leader>f :Ack <space>

"Python
let python_highlight_all=1
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
au FileType python noremap <Leader>l :PymodeLintAuto<CR>
au FileType python noremap <Leader>g :YcmCompleter GoToDeclaration<CR>
au FileType python noremap <Leader>r :YcmCompleter GoToReferences<CR>

"YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger=1
nnoremap <leader>; :YcmCompleter FixIt<CR>

"cpp
au FileType c,cpp let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
au FileType c,cpp nnoremap gd :YcmCompleter GoTo<CR>


"Tex
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_motion_matchparen=0
au BufnewFile,BufRead *.tex set ft=tex
au FileType tex,plaintex set spelllang=en_us spell
au FileType tex noremap <Leader>ll :VimtexCompileToggle<CR>
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

com! WM call WritingMode()



"Tags
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
            \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
