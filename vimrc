source ~/.vim/basic-settings.vim
source ~/.vim/keymap.vim

" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run :PlugInstall if any plugins are missing
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" List of plugins
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai', { 'branch': 'master', 'depth': 1 }
Plug 'itchyny/lightline.vim', { 'branch': 'master', 'depth': 1 }
Plug 'mengelbrecht/lightline-bufferline', { 'branch': 'master', 'depth': 1 }
Plug 'preservim/nerdtree', { 'branch': 'master', 'depth': 1 }
Plug 'sheerun/vim-polyglot', { 'branch': 'master', 'depth': 1 }
Plug 'machakann/vim-highlightedyank', { 'branch': 'master', 'depth': 1 }
Plug 'tpope/vim-commentary', { 'branch': 'master', 'depth': 1 }
Plug 'jiangmiao/auto-pairs', { 'branch': 'master', 'depth': 1 }
Plug 'lambdalisue/vim-nerdfont', { 'branch': 'master', 'depth': 1 }
call plug#end()

" Basic settings
imap / /<C-x><C-f>

" Plugin settings
colorscheme molokai
nnoremap <silent><C-e> :NERDTreeToggle<CR>
set laststatus=2
set showtabline=2
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#margin_left = 1
let g:lightline#bufferline#margin_right = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['clone'] ]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ }
  \ }
