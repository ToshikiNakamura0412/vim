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
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'github/copilot.vim'
call plug#end()

" Basic settings
imap / /<C-x><C-f>

" Plugin settings
colorscheme molokai
nnoremap <silent><C-e> :NERDTreeToggle<CR>
set laststatus=2
set showtabline=2
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline = {
  \ 'colorscheme': 'powerlineish',
  \ 'tabline': {
  \   'left': [ ['buffers'] ]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel'
  \ }
  \ }
