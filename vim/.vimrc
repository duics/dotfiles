call plug#begin('~/.vim/plugged')

"" Core
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'svermeulen/vim-easyclip'
"" Autocomplete/linting
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
"" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'dyng/ctrlsf.vim'
"" Style
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-two-firewatch'

"" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"" Elixir
Plug 'elixir-lang/vim-elixir'

call plug#end()

runtime! confs/basic.vim
runtime! confs/gvim.vim
runtime! confs/ycm-ultisnips-supertab.vim

"" Theme
set background=dark
let g:two_firewatch_italics=1
let g:airline_powerline_fonts = 1
colo two-firewatch
set t_Co=256

let g:airline_theme='twofirewatch'
