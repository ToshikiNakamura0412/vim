" === Look ===
set number
set cursorline
set mouse=a
set colorcolumn=121
highlight ColorColumn guibg=gray ctermbg=gray
" Enable True Color
if has('nvim')
  set termguicolors
endif
" The maximum number of items to show in the popup menu
set pumheight=10

" === Control ===
" Allows other files to be opened while buffers are being edited
set hidden
" Scroll margin
set scrolloff=20
" Allow the cursor to move one character beyond the end of line
set virtualedit=onemore
" Allows movement across lines
set whichwrap=b,s,h,l,<,>,[,],~

" === Edit ===
" Copy to clipboard
set clipboard=unnamedplus
" Remove space at the end of line when saving
autocmd BufWritePre * :%s/\s\+$//ge
" Place the cursor at the last position of the last time when opening file
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
" undo
if has('persistent_undo')
  if has('nvim')
    set undodir=~/.config/nvim/undo
  else
    set undodir=~/.vim/undo
  endif
  set undofile
endif
" Don't create backupfiles
set nobackup
" Don't create swapfiles
set noswapfile

" === Tab ===
" Show Tab with ▸-
set list listchars=tab:\▸\-
" Auto indent size
set autoindent
set smartindent
set cindent
set smarttab
" Indent size when shifting text
set shiftwidth=4
" The number of space as Tab
set softtabstop=4
set tabstop=4
" Make Tab half-width space
set expandtab
" Indent size for each filetype
if has("autocmd")
  " Enable file type search
  filetype plugin on
  " Use indentation according to file type
  filetype indent on
  "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtab
  autocmd FileType sh   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType c    setlocal sw=2 sts=2 ts=2 et
  autocmd FileType cpp  setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim  setlocal sw=2 sts=2 ts=2 et
endif


" === Search ===
" Ignore upper and lower case letters when searching
set ignorecase
" Normal search
set smartcase
" Highlight search
set hlsearch
" Incremental search
set incsearch
