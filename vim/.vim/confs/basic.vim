"" Default indentation
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

"" Line numbers
set number
set relativenumber

"" Visualize whitespace
set listchars=tab:>>,trail:␣,extends:>,precedes:<
set list

"" Save swapfiles to own dir
set nobackup
set swapfile
set directory=/var/tmp,/tmp

"" Map leader to space
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

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

"" Git
noremap <Leader>gw :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Set working directory
nnoremap <leader>d :cd %:p:h<CR>

"" Ctrl-P
nnoremap <C-p> :FZF<cr>

"" Netrw
let g:netrw_liststyle=1

" Mapping for easy-clip
" nnoremap gm m

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let $FZF_DEFAULT_COMMAND= 'ag -g ""'
endif
nnoremap <Leader>a :CtrlSF<Space>

"" Tests
let test#filename_modifier = ':p'
let test#strategy = 'vimproc'
