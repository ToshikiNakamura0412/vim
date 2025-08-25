" === Normal ===
noremap <Esc><Esc> :nohlsearch<CR><Esc>
noremap <Space>h ^
noremap <Space>l $
noremap <C-n> :bnext<CR>
noremap <C-p> :bprevious<CR>

" === Insert ===
inoremap jj <Esc>
inoremap <C-o> <C-o>o
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <del>
inoremap <C-a> <Home>
inoremap <C-e> <End>
" No line break on Enter in completion candidate display
inoremap <expr><CR>    pumvisible() ? "\<C-y>" : "<CR>"
inoremap <expr><Tab>   pumvisible() ? "\<C-y>" : "<Tab>"
" Select a candidate for completion by Tab/Shift-Tab (Up/Down)
inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "<Down>"
inoremap <expr><Up>    pumvisible() ? "\<C-p>" : "<Up>"

" === Terminal ===
tnoremap <C-o> <C-\><C-n>
