execute pathogen#infect()

syntax on
set bg=dark
set t_Co=256

set binary
set noeol
set number
set ts=4
set expandtab
set shiftwidth=4
set cursorline
set autoindent

au BufNewFile *.py r ~/.vim/template.py

" enable beep
set novisualbell

" show the matching part of the pair for [] {} and ()
set showmatch
set matchtime=0



" syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" tarbar
nmap <F8> :TagbarToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Nerdtree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>

" jedi
autocmd FileType python setlocal completeopt-=preview

colorscheme monokai
let g:molokai_original = 1
let g:rehash256 = 1
" highlight Normal ctermfg=grey ctermbg=darkblue

"auto format
noremap <F3> :Autoformat<CR>

" Easy motion
map ,, <Plug>(easymotion-prefix)

let python_highlight_all = 1


