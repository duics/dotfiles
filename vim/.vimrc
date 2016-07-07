set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/syntastic'

Plugin 'suan/vim-instant-markdown'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'dhruvasagar/vim-table-mode'

Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Raimondi/delimitMate'

Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'heavenshell/vim-jsdoc'

Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'mileszs/ack.vim'

" Plugin 'lervag/vimtex'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'a.vim'
Plugin 'DoxygenToolkit.vim'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'larrylv/ycm-elixir'

" Plugin 'hsanson/vim-android'

" Clojure plugins
" Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'guns/vim-clojure-static'
" Plugin 'tpope/vim-fireplace'
" Plugin 'tpope/vim-salve'
" Plugin 'guns/vim-clojure-highlight'
" Plugin 'venantius/vim-cljfmt'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
if has('gui_running')
    " set guifont=Sauce\ Code\ Powerline:h9:cANSI
    set guifont=mononoki\ 11
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set t_Co=256
endif
colorscheme deep-space
set background=dark

" python mode settings
" let g:pymode_python = 'python3'
" let g:pymode_rope = 0
" let g:pymode_lint = 1
" let g:pymode_lint_on_write = 1
" let g:pymode_lint_checkers = ['pylint', 'pep8']
" let g:pymode_rope_lookup_project = 0

" 80 column
set colorcolumn=80

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
set autoread
set wildmenu
set laststatus=2
set noshowmode
set ruler
set showcmd
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
syntax on
set number
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

set clipboard^=unnamed,unnamedplus
set t_Co=256

" Syntastic RC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_auto_jump = 1

"Strictly necessary for Powerline
set encoding=utf-8
set nobackup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
let g:config_Beautifier = {}
let g:config_Beautifier['html'] = {}
let g:config_Beautifier['html'].indent_size = '2'
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].indent_size = '2'


map <C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endi

" Mapping for easy-clip
nnoremap gm m

set hlsearch
" set HLNext (from http://www.youtube.com/watch?v=aHm36-na4-4)
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>
highlight WhiteOnRed ctermbg=white guibg=red
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let blinks = 3
  for n in range(1,blinks)
    let red = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
    call matchdelete(red)
    redraw
    exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
  endfor
endfunction

" Markdown tables
let g:table_mode_corner="|"

" Ignore nodejs files
let g:ctrlp_custom_ignore = 'node_modules\|resources'

" Riotjs setting
au BufNewFile,BufRead *.tag setlocal ft=javascript
let g:javascript_enable_domhtmlcss = 1
let g:used_javascript_libs = 'underscore,chai,backbone'
autocmd BufReadPre *.tag let b:javascript_lib_use_underscore = 1

" YCM config for C++
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_enable_diagnostic_signs = 1
" let g:ycm_enable_diagnostic_highlighting = 1
" let g:ycm_always_populate_location_list = 1
" let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

set cino=N-s

imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Doxygen config
let g:DoxygenToolkit_authorName="Max Salminen"

" Tagbar config
nmap <F8> :TagbarToggle<CR>
