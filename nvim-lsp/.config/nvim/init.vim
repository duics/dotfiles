call plug#begin('~/.local/share/nvim/plugged')

" Tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'

" Git
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'jreybert/vimagit'


Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'wellle/targets.vim'
Plug 'mattn/emmet-vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'w0rp/ale'

Plug 'mattn/vim-lsp-settings'
Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'
Plug 'duics/vim-snippets'

Plug 'prettier/vim-prettier'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
" Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'editorconfig/editorconfig-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Zabanaa/neuromancer.vim'
Plug 'ajmwagar/vim-deus'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" Initialize plugin system
call plug#end()

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

set ignorecase      " Search ignoring case
set smartcase       " Keep case when searching with *
" set infercase       " Adjust case in insert completion mode
" set incsearch       " Incremental search
" set hlsearch        " Highlight search results
" set wrapscan        " Searches wrap around the end of the file
" set showmatch       " Jump to matching bracket
" set matchpairs+=<:> " Add HTML brackets to pair matching
" set matchtime=1     " Tenths of a second to show the matching paren
" set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

:set number relativenumber
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END
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

" colors deus
colors challenger_deep
" colorscheme neuromancer
" color dracula
highlight Comment cterm=italic

"" Map leader to space
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

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
noremap <Leader>ml :<C-u>LspDocumentDiagnostics<CR>
noremap <Leader>mr :<C-u>LspReferences<CR>
noremap <Leader>mR :<C-u>LspRename<CR>
noremap <Leader>ms :<C-u>LspStatus<CR>
noremap <Leader>md :<C-u>LspDefinition<CR>
noremap <Leader>mD :<C-u>LspDeclaration<CR>
noremap <Leader>mm :<C-u>LspCodeAction<CR>
noremap <Leader>mi :<C-u>LspHover<CR>
noremap <Leader>mn :<C-u>LspNextDiagnostic<CR>

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✖'}
let g:lsp_signs_warning = {'text': '⚠'} " icons require GUI
let g:lsp_signs_hint = {'text': '??'}

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1


"" Autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-s>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))

let g:tmuxcomplete#asyncomplete_source_options = {
        \ 'name':      'tmuxcomplete',
        \ 'whitelist': ['*'],
        \ 'config': {
        \     'splitmode':      'words',
        \     'filter_prefix':   1,
        \     'show_incomplete': 1,
        \     'sort_candidates': 0,
        \     'scrollback':      0,
        \     'truncate':        0
        \     }
        \ }
endif

"" Git
noremap <Leader>gw :<C-u>Gwrite<CR>
noremap <Leader>gc :<C-u>Gcommit<CR>
noremap <Leader>gsh :<C-u>Gpush<CR>
noremap <Leader>gll :<C-u>Gpull<CR>
noremap <Leader>gs :<C-u>Magit<CR>
noremap <Leader>g! :<C-u>Gblame<CR>
noremap <Leader>gd :<C-u>Gvdiff<CR>
noremap <Leader>gr :<C-u>Gremove<CR>
noremap <Leader>gla :<C-u>GV<CR>
noremap <Leader>glf :<C-u>GV!<CR>
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterNextHunk)
nmap <Leader>ghs <Plug>(GitGutterStageHunk)
nmap <Leader>ghu <Plug>(GitGutterUndoHunk)

"" Set working directory
nnoremap <leader>d :cd %:p:h<CR>

"" Nerdtree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


"" Ctrl-P
nnoremap <Leader>sf :<C-u>FZF<cr>
nnoremap <Leader>pf :<C-u>GFiles<cr>
nnoremap <Leader>pm :<C-u>GFiles?<cr>
nnoremap <Leader>sp :<C-u>Rg<cr>

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


" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0

"" airline config
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
let g:airline#extensions#lsp#enabled = 1
