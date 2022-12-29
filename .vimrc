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
Plug 'frazrepo/vim-rainbow'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }



Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()
nnoremap <SPACE> <Nop>
let mapleader = " "

au FileType c,cpp,ts,js,json call rainbow#load()

set statusline+=%f
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

filetype plugin on
runtime macros/matchit.vim
nnoremap <C-S-e> :NERDTreeToggle<CR>

set number 
set relativenumber
set noswapfile
syntax on
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <Leader><Tab> :tabn<CR>
nnoremap <Leader><S-Tab> :tabp<CR>
nnoremap <silent> <Leader><Up> :exe "resize +5"<CR>
nnoremap <silent> <Leader><Down> :exe "resize -5"<CR>
nnoremap <silent> <Leader><Left> :exe "vertical resize +15"<CR>
nnoremap <silent> <Leader><Right> :exe "vertical resize -15"<CR>
nmap <Leader>e :NERDTreeFind<CR>


set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*/node_modules/*,*/dist/*,*/__pycache__/*,*/venv/*
"hi Constant ctermfg=13 guifg=Fuchsia
hi Comment ctermfg=LightGray guifg=LightGray

set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set hidden
set incsearch
set nowrap

if &term =~ '^xterm'
  let &t_SI .= "\<Esc>[6 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 4 -> solid underscore
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
"close tags
"inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O
"ab teh the
