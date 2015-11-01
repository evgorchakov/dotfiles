"HERE BE RUNTIME CONFIGURATION

"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'elzr/vim-json'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

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
set cursorline
set wildmenu

"Search
set ignorecase
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set mouse=a


"Color 
let base16colorspace=256
colorscheme base16-summerfruit

"Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"NERDTree
noremap <C-n> :NERDTreeToggle<CR>

"Ctrlp
"
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_cmd = 'CtrlPMixed'
"General
set autoindent
set backspace=indent,eol,start
set hidden

"Tags
set tags=./tags,tags;$HOME
nmap <leader><t> :TagbarToggle<CR>

"Misc
set exrc
set secure
set colorcolumn=80

"Filetypes
autocmd Filetype html setlocal ts=2 sts=2 sw=2
