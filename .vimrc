" checks if vim plug is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'


Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

filetype plugin on
nnoremap <C-S-e> :NERDTreeToggle<CR>

set number 
set relativenumber
set noswapfile
syntax on
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*/node_modules/*,*/dist/*,*/__pycache__/*,*/venv/*
"hi Constant ctermfg=13 guifg=Fuchsia
hi Comment ctermfg=LightGray guifg=LightGray

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set hidden
set incsearch
set nowrap

"close tags
"inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O
"ab teh the
