call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/CSApprox'
Plug 'jreybert/vimagit'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'svermeulen/vim-easyclip'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ap/vim-css-color'

"" Autocomplete/linting
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'

"" File finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'dyng/ctrlsf.vim'

"" Lang
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

"" Theme
Plug 'roosta/vim-srcery'

call plug#end()


source $HOME/.config/nvim/confs/basic.vimrc
source $HOME/.config/nvim/confs/statusline.vimrc

let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

map <C-e> :NERDTreeToggle<CR>
set termguicolors
colorscheme srcery
