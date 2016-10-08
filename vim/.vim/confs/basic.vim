"" Default indentation
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

"" Save swapfiles to own dir
set swapfile
set dir=~/.vim/tmp

"" Map leader to space
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>b :bn<CR>

"" Clean highlight
nnoremap <silent> <leader><space> :noh<cr>

"" Split
noremap <Leader>sh :<C-u>split<CR>
noremap <Leader>sv :<C-u>vsplit<CR>

"" Tabs
" nnoremap <leader>tn :tabnew<CR>
" nnoremap <leader>th :tabprevious<CR>
" nnoremap <leader>tl :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-q>     :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-q>     <Esc>:tabclose<CR>

"" Set working directory
nnoremap <leader>d :cd %:p:h<CR>

"" Ctrl-P
nnoremap <C-p> :FZF<cr>

" Mapping for easy-clip
nnoremap gm m

