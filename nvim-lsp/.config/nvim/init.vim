call plug#begin('~/.local/share/nvim/plugged')

" Tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
" Plug 'sheerun/vim-polyglot'

" Git
Plug 'sodapopcan/vim-twiggy'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'

Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
" Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'editorconfig/editorconfig-vim'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Zabanaa/neuromancer.vim'
Plug 'roosta/vim-srcery'

"TS
"Plug 'leafgarland/typescript-vim'

" Initialize plugin system
call plug#end()

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" set mouse=nv                 " Disable mouse in command-line mode
" set modeline                 " automatically setting options from modelines
" set report=0                 " Don't report on line changes
" set errorbells               " Trigger bell on error
" set visualbell               " Use visual bell instead of beeping
" set hidden                   " hide buffers when abandoned instead of unload
" set fileformats=unix,dos,mac " Use Unix as the standard file type
" set magic                    " For regular expressions turn magic on
" set path=.,**                " Directories to search when using gf
" set virtualedit=block        " Position cursor anywhere in visual block
" set synmaxcol=1000           " Don't syntax highlight long lines
" set formatoptions+=1         " Don't break lines after a one-letter word

" set textwidth=80    " Text width maximum chars before wrapping
" set noexpandtab     " Don't expand tabs to spaces.
set tabstop=2         " The number of spaces a tab is
set softtabstop=2     " While performing editing operations
set shiftwidth=2      " Number of spaces to use in auto(indent)
" set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent        " Use same indenting on new lines
set autoread          " Read file automatically if changed outside of nvim
" set shiftround      " Round indent to multiple of 'shiftwidth'

" set ignorecase      " Search ignoring case
" set smartcase       " Keep case when searching with *
" set infercase       " Adjust case in insert completion mode
" set incsearch       " Incremental search
" set hlsearch        " Highlight search results
" set wrapscan        " Searches wrap around the end of the file
" set showmatch       " Jump to matching bracket
" set matchpairs+=<:> " Add HTML brackets to pair matching
" set matchtime=1     " Tenths of a second to show the matching paren
" set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
" set nowrap                      " No wrap by default
" set linebreak                   " Break long lines at 'breakat'
" set breakat=\ \	;:,!?           " Long lines break chars
" set nostartofline               " Cursor in same column for few commands
" set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
" set splitbelow splitright       " Splits open bottom right
" set switchbuf=useopen,usetab    " Jump to the first open window in any tab
" set switchbuf+=vsplit           " Switch buffer behavior to vsplit
" set backspace=indent,eol,start  " Intuitive backspacing in insert mode
" set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
" set showfulltag                 " Show tag and tidy search in completion
" set complete=.                  " No wins, buffs, tags, include scanning
" set completeopt=menuone         " Show menu even for one item
" set completeopt+=noselect       " Do not select a match in the menu

" set noshowmode          " Don't show mode in cmd window
" set shortmess=aoOTI     " Shorten messages and don't show intro
" set scrolloff=2         " Keep at least 2 lines above/below
" set sidescrolloff=5     " Keep at least 5 lines left/right

" set showtabline=2       " Always show the tabs line

" set noshowcmd           " Don't show command in status line
" set cmdheight=2         " Height of the command line
" set cmdwinheight=5      " Command-line lines
" set noequalalways       " Don't resize windows on split or close
" set laststatus=2        " Always show a status line
" set colorcolumn=80      " Highlight the 80th character limit
" set display+=lastline
"
"" Visualize whitespace
set listchars=tab:>>,trail:␣,extends:>,precedes:<
set list

if has('mac')
	let g:clipboard = {
		\   'name': 'macOS-clipboard',
		\   'copy': {
		\      '+': 'pbcopy',
		\      '*': 'pbcopy',
		\    },
		\   'paste': {
		\      '+': 'pbpaste',
		\      '*': 'pbpaste',
		\   },
		\   'cache_enabled': 0,
		\ }
endif

"" Save swapfiles to own dir
set nobackup
set swapfile
set backupdir:
set directory=/var/tmp,/tmp
set backupdir=/var/tmp,/tmp


" Enable 256 color terminal
set t_Co=256

" Enable true color
if has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep
" colorscheme neuromancer
" color dracula

" map <C-e> :NERDTreeToggle<CR>

"" Map leader to space
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>pf :<C-u>GFiles<CR>
nnoremap <Leader>s :<C-u>CtrlSq<CR>

"" Clean highlight
nnoremap <silent> <leader><space> :noh<cr>

"" Terminal
noremap <Leader>tv :<C-u>vsplit<CR>:<C-u>terminal<CR>
noremap <Leader>th :<C-u>split<CR>:<C-u>terminal<CR>

"" Tabs
" nnoremap <leader>tn :tabnew<CR>
" nnoremap <leader>th :tabprevious<CR>
" nnoremap <leader>tl :tabnext<CR>
nnoremap <C-k>     :tabprevious<CR>
nnoremap <C-j>     :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-x>     :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-q>     <Esc>:tabclose<CR>

"" Buffers
noremap <Leader>bp :<C-u>bprevious<CR>
noremap <Leader>bn :<C-u>bnext<CR>
noremap <Leader>bd :<C-u>bd<CR>
noremap <Leader>bb :<C-u>Buffers<CR>


"" LSP
noremap <Leader>mf :<C-u>LspDocumentFormat<CR>
noremap <Leader>mr :<C-u>LspReferences<CR>
noremap <Leader>mR :<C-u>LspRename<CR>
noremap <Leader>ms :<C-u>LspStatus<CR>
noremap <Leader>md :<C-u>LspDefinition<CR>
noremap <Leader>mD :<C-u>LspDeclaration<CR>
noremap <Leader>mm :<C-u>LspCodeAction<CR>
noremap <Leader>mi :<C-u>LspHover<CR>
noremap <Leader>me :<C-u>LspNextError<CR>
noremap <Leader>mw :<C-u>LspNextWarning<CR>


"" Git
noremap <Leader>gw :<C-u>Gwrite<CR>
noremap <Leader>gc :<C-u>Gcommit<CR>
noremap <Leader>gsh :<C-u>Gpush<CR>
noremap <Leader>gll :<C-u>Gpull<CR>
noremap <Leader>gs :<C-u>Gstatus<CR>
noremap <Leader>gb :<C-u>Twiggy<CR>
noremap <Leader>g! :<C-u>Gblame<CR>
noremap <Leader>gd :<C-u>Gvdiff<CR>
noremap <Leader>gr :<C-u>Gremove<CR>
" noremap <Leader>gs :Magit<CR>

"" Set working directory
nnoremap <leader>d :cd %:p:h<CR>


"" Ctrl-P
nnoremap <Leader>sf :<C-u>FZF<cr>
nnoremap <Leader>pf :<C-u>GFiles<cr>
nnoremap <Leader>rg :<C-u>Rg<cr>

nnoremap <Leader>ss :<C-u>Snippets<cr>
nnoremap <Leader>sc :<C-u>Commits<cr>
nnoremap <Leader>sr :<C-u>CtrlSF<Space>
nnoremap <Leader>sh :<C-u>Helptags<Space>

nnoremap <Leader>bb :<C-u>Buffers<cr>

" All status line configuration goes here

set cmdheight=1
set display+=lastline

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it

" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
" let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'base16_pop'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''

let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" disable unused extensions (performance)
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 1
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
