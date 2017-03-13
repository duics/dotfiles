call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/CSApprox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ap/vim-css-color'
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim'

"" Autocomplete/linting
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'

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

set inccommand=split
" Change cursor shape depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

map <C-e> :NERDTreeToggle<CR>
set termguicolors
colorscheme srcery
