call plug#begin('~/.vim/plugged')

"" Core
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
"" Autocomplete/linting
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'ervandew/supertab'
" Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
Plug 'janko-m/vim-test'
"" Search
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
"" Style
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'roosta/vim-srcery'

"" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

"" Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug '~/.vim/confs/elm', { 'for': 'elm' }
Plug 'mattn/emmet-vim'

call plug#end()

runtime! confs/basic.vim
runtime! confs/gvim.vim
runtime! confs/ycm-ultisnips-supertab.vim

"" Theme
set background=dark
let g:airline_powerline_fonts = 1
colorscheme srcery
set t_Co=256


"" TEMP
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
