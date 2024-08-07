" ============================================================================
" Vim Server Config
" ============================================================================
"
" Vim-plug Installation  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Do not modify
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
" Active plugins
" ============================================================================
call plug#begin('~/.vim/plugged') " Initializes plugin definitions

" ----------------------------------------------------------------------------
" Passive Environment Enhancments
" ----------------------------------------------------------------------------


# - TODO: Lookup and make not

Plug 'tpope/vim-repeat'                         " 
Plug 'ryanoasis/vim-devicons'                   " File Explorer - Icons by file type
Plug 'scrooloose/syntastic'                     " Syntastic - Multi-language error highlighting
Plug 'arielrossanigo/dir-configs-override.vim'  " Override .vimrc with configs from .vim.custom per directory
Plug 'fisadev/FixedTaskList.vim'                " Pending tasks list; TODO, FIXME, XXX, and custom
Plug 'fisadev/fisa-vim-colorscheme'             " Terminal Vim with 256 colors colorscheme
Plug 'vim-scripts/IndexedSearch'                " Displays number of search matches at bottom of the screen
Plug 'vim-airline/vim-airline'                  " Airline - Lower status bar
Plug 'vim-airline/vim-airline-themes'           " Airline - Lower status bar
Plug 'inkarkat/vim-ReplaceWithRegister'         " Replaces text under cursor with text from registry - more details
Plug 'Yggdroot/indentLine'                      " Adds indent lines

" TODO: Review reatures/if there is a beter option and auto indent on new line
Plug 'Townk/vim-autoclose' " Autoclose

"Notes commenting  - needs more detail - Does this go in Features ???
Plug 'cometsong/CommentFrame.vim'

" ----------------------------------------------------------------------------
" Features Enhancments
" ----------------------------------------------------------------------------


Plug 'zerowidth/vim-copy-as-rtf'
" TODO: Eval Markdown Plugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" TODO: Eval Markdown Draw Plugin - is it really needed if markdown plug is good?
" Plug 'Scuilion/markdown-drawer'                                     " Renders Markdown
"
" Plug 'blueyed/vim-diminactive'                                      " Dimms Splits
" TODO: harpoon is only for neovim - Investigate alternitive for vim
" Plug 'ThePrimeagen/harpoon'                                         " Marks per project - Workflow enhancement
Plug 'tpope/vim-commentary'                                         " Commentary - Enhanced commenting
Plug 'rosenfeld/conque-term'                                        " Conque    - Shell in vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'                                          " NERDTree - Better file browser
Plug 'myusuf3/numbers.vim'                                          " Numbers   - Toggle for relative numbers <leader>rn
Plug 'axiaoxin/vim-json-line-format'                                " Pretty Json - Plugin to format <leader>wj
Plug 'fisadev/vim-isort'                                            " Python Sort - Automatically sort python imports
Plug 'tpope/vim-surround'                                           " Surround - quick surrond of elements
Plug 'vimwiki/vimwiki'                                              " Vimwiki - Imbedded note taking structure

" TODO: Eval - if bad remove pluggin settings
Plug 'kien/tabman.vim'                                              " Tabman - Tab list panel - worth it?


" ----------------------------------------------------------------------------
" Application
" ----------------------------------------------------------------------------

" TODO: Evaluate polygot syntax highlighting/features vs dedicated plugins
Plug 'sheerun/vim-polyglot'                         " 120+ file type syntax highlighting
Plug 'ekalinin/Dockerfile.vim'                      " Docker
Plug 'tpope/vim-fugitive'                           " Git       - interation functionality
Plug 'mhinz/vim-signify'                            " Git       - Shows line changes in sign bar
Plug 'fatih/vim-go', {'do': 'GoInstallBinaries' }   " Go
Plug 'valloric/MatchTagAlways'                      " HTML/XML  - Always highlight matching tag
Plug 'martinda/Jenkinsfile-vim-syntax'              " Jenkins
Plug 'burningtree/awesome-json'                     " Json
Plug 'robbles/logstash.vim'                         " Logstash
Plug 'davidhalter/jedi-vim'                         " Python
" TODO: Eval Conquer of Completion vs jedi
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TODO: Not Great plugin fix - syntaxtic
" Plug 'psf/black'                                   " Python Syntax Highlighting
Plug 'hashivim/vim-terraform'                       " Terraform
Plug 'yorinasub17/vim-terragrunt'                   " Terragrunt

" ----------------------------------------------------------------------------
" To be reviewed plugins
" ----------------------------------------------------------------------------
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'


" " Testing Auto Complete options
" Plug 'vim-scripts/AutoComplPop'

" " Potentially enhanced version of
" Plug 'tomtom/tcmment_vim'

" TODO: Deep dive on functionallity  - in conversation with transition to vim
" tabs
" Window chooser
Plug 't9md/vim-choosewin'

Plug 'neomake/neomake'                              " Async build to run programs - Explore for Go - etc
" ----------------------------------------------------------------------------
" Check it out eventually
" ----------------------------------------------------------------------------

" TODO: Finish reviewing plugins here and in fisa 12 config

" Indent text object - TODO; needs more research (accidentially indented who
" block - not sure if it was thiws pluging)
Plug 'michaeljsmith/vim-indent-object'

" TODO: Maaaaybe i'll use it - move by indent level (could be good for json)
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'

" TODO: Investigate usefullnss - not currently enabled
" I belive I disabled this one becasue it was annoying early on
"
" Better autocompletion
" NOW: TODO: Re-enable once buf is found
" Plug 'Shougo/neocomplcache.vim'

" TODO: Explore best Snippets manager
" TODO: Create base snippits for python and tf
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'


call plug#end() " End of Plugins

" ============================================================================
" Install plugins the first time vim runs
" ============================================================================

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim Settings and Maps
" ============================================================================

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Basic Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set encoding=utf-8              " Enforces standard encoding
set hidden                      " Keeps buffers open in the background
set noerrorbells                " Turns off chimes
set clipboard=unnamed           " Copy to clipboard
set noswapfile                  " Disables swap files
set nobackup                    " Disables backup files
set nu                          " show line numbers
set scrolloff=8                " Pading between top/bottom screen for scroll
set nocompatible                " No vi-compatible
set spr                         " Forces split to the right
set backspace=indent,eol,start  " Backspace like normal
set incsearch                   " Incremental search
set hlsearch                    " Highlighted search results
set cursorline                  " Highlights current line background


" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set nowrap                    " Disables test wrapping

" better backup, swap and undos storage
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo



" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
" TODO: Testing for compatibility with predictions workflow
set wildmode=list:longest

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Basic Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
filetype plugin indent on
syntax on    " syntax highlight on

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" File Conditional Settings
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Tab length by file - some altered by plugin
" TODO: Maybe remove these set default to 4 and create conditional for json only
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" My maps and leader actions
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Set longer time to respond after leaader key is pressed
set timeoutlen=3000


" Use jj to escape from insert mode
imap jj <Esc>

" Makes Y function as expected - yank to end of line
noremap Y y$

" Remaps navigagtion to visual lines instead of lines
noremap k gk
noremap gk k
noremap j gj
noremap gj j

" Remaps word motions jump by 'WORD' instad of 'word'
" TODO: Should I restore to normal -> pros/cons of skipping by grouped words
" noremap w W
" noremap W w
" noremap b B
" noremap B b
" noremap e E
" noremap E e



" Remaps next motions to center to screen
" TODO: Doesn't work -> Why?

noremap n nzz
noremap N Nzz

noremap <leader>pl  0iPlug '<ESC>A'<ESC>

" Paste yanked code at the end of the line after space
noremap <leader>ap 0A <ESC>p

" Yanks values from current line and pastes them at the end of the line below
noremap <leader>aap 0Dj0A <ESC>pkdd

" Runs current python file
nnoremap <leader>xx :w<CR>:echo system('python3 "' . expand('%') . '"')<cr>

" Makes slash blank clear last search
:nnoremap <leader>l :nohl<CR><C-l>

" TODO: Check in on what gv does to potentially change mapping
"" Quickly edit/reload this configuration file
nnoremap <leader>ve :tabnew $MYVIMRC<CR>
nnoremap <leader>ze :tabnew ~/.zprofile<CR>
nnoremap <leader>sc :so $MYVIMRC<CR>

" tab navigation mappings
noremap <leader>tn :tabnew
noremap <leader>tl :tabn<CR>
noremap <leader>th :tabp<CR>
noremap <leader>tm :tabm

" Move tabs Left / right
noremap <leader>tth :tabm -1<CR>
noremap <leader>ttl :tabm +1<CR>


" split navigation
noremap <leader>sn :vsp
noremap <leader>sj <C-W>j
noremap <leader>sk <C-W>k
noremap <leader>sh <C-W>h
noremap <leader>sl <C-W>l
noremap <leader>sl <C-W>l

" File jumps
"
noremap <leader>wv :tabnew ~/.vimrc<CR>`C

" navigate windows with meta+arrows
" TODO: Should I add imap version of above navigation
"
" imap <M-Right> <ESC><c-w>l
" imap <M-Left> <ESC><c-w>h
" imap <M-Up> <ESC><c-w>k
" imap <M-Down> <ESC><c-w>j

" old autocomplete keyboard shortcut
" TODO: Wasn't working
" imap <C-J> <C-X><C-O>
"
" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
" Danny disabled - TODO: Testing for compatibility with predictions workflow
" set completeopt-=preview
" set completeopt-=menu

" save as sudo
ca w!! w !sudo tee "%"

" simple recursive grep
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif


" TODO: Fix Background vs inactive window issues.
" Setting transparent background

" hi Normal guibg=NONE ctermbg=NONE
" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" highlight clear SignColumn
highlight clear LineNr




" create needed directories if they don't exist
" if !isdirectory(&backupdir)
    " call mkdir(&backupdir, "p")
" endif
" if !isdirectory(&directory)
    " call mkdir(&directory, "p")
" endif
" if !isdirectory(&undodir)
    " call mkdir(&undodir, "p")
" endif

" " ============================================================================
" Plugins settings and mappings
" ============================================================================

" indentLine -----------------------------
let g:indentLine_char_list = ['┆']

" NERDTREE -----------------------------

" toggle nerdtree display
nnoremap <leader>n :NERDTreeToggle<CR>

" open nerdtree with the current file selected
" TODO: disable nerd tree always on by default?
"
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Stops override of Nerdtree buffer with other buffer
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Closes NerdTree tab if its the only remaining tab
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" TASKLIST ------------------------------

" SYNTASTIC ------------------------------

" List erros at bottom of file
nmap <leader>e :Errors<CR>
nmap <leader>ec :lclose<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Recomended stting
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1               " Checks erros on open
let g:syntastic_check_on_wq = 0                 " TODO: FIND WHAT THIS DOES

" My additions
let g:syntastic_enable_signs = 1                " Show/Hide error on sign column
let g:syntastic_python_checkers = ['pylint', 'flake8', 'pyflakes', 'python']

" Forces usage of python3
" let g:syntastic_python_python_exec = 'python3.9'

" JEDI ------------------------------
" TODO: Document Jedi settings
let g:jedi#environment_path = "/usr/local/bin/python3"

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Alt usage 0
let g:jedi#use_tabs_not_buffers = 1
" map ,D :tab split<CR>:call jedi#goto()<CR>

" let g:jedi#environment_path = "venv"
" :let jedi#force_py_version=3.8
"
" NEOCOMPLCACHE ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make
" it play nice)
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_ignore_case = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_enable_fuzzy_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_fuzzy_completion_start_length = 1
"let g:neocomplcache_auto_completion_start_length = 1
"let g:neocomplcache_manual_completion_start_length = 1
"let g:neocomplcache_min_keyword_length = 1
"let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
"let g:neocomplcache_same_filetype_lists = {}
"let g:neocomplcache_same_filetype_lists._ = '_'

" TABMAN ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'
let g:tabman_focus  = '.tfv'

" AUTOCLOSE ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" SIGNIFY ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
" nmap <leader>sn <plug>(signify-next-hunk)
" nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" WINDOW CHOOSER ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" AIRLINE ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled=1
let g:airline_detect_modified=1
let g:airline_section_c_only_filename = 1

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols.maxlinenr= ''

" let g:airline_symbols.space = "a0"
let g:airline_symbols.space = "\ua0"
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'


" FIXED TASK ---------------------------------
let g:tlTokenList = ["FIX", "TODO", "DATE", "NOW", "NOTE"]

" FZF ---------------------------------
noremap <leader>rg :rg

" MARKDOWN -----------------------------

let g:vim_markdown_folding_disabled=1

" MARKDOWN-DRAW -----------------------------
nnoremap <Leader>md :MarkDrawer<cr>
let g:markdrawer_width = "150"

" NUMBERS -----------------------------

nnoremap <leader>rn :NumbersToggle<CR>

" vimwiki ------------------------------
"
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

noremap <leader>wt :tabnew ~/vimwiki/index.md<CR>
noremap <leader>ws :vsp ~/vimwiki/index.md<CR>

" let wiki = {}
" let wiki.path = '~/my_wiki/'
" let wiki.nested_syntaxes = {'python': 'python'}
" let g:vimwiki_list = [wiki]

" vimfugitive ------------------------------

nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit
nmap <leader>gh :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
" ============================================================================
" Viml configs
" ============================================================================

" Trims whitespace from end of every line across all files
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppattern %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup RM_WHITE_SPACE autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

" ============================================================================
" INSPECTOR
" ============================================================================
let g:vimspector_enable_mappings = 'HUMAN'

" ============================================================================
" SNIPMATE
" ============================================================================
let g:snipMate = { 'snippet_version' : 1 }

" ============================================================================
" Vim DevIcons
" ============================================================================
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


" ============================================================================
" DEVICONS
" ============================================================================
" let g:diminactive_use_colorcolumn = 0"
" hi ColorColumn
" ColorColumn    xxx term=reverse ctermbg=1 guibg=DarkRed
"let g:diminactive_use_syntax = 1
"
" ============================================================================
" EVAL
" ============================================================================

" I think this is covered by FZF - which doesn't required a pre-req
" Plug 'mileszs/ack.vim' " Ack code search (requires ack installed in the system)
"
" Plugins from vim-scripts repos:

" " XML/HTML tags navigation - matches searches?  - really old plugin
" Plug 'vim-scripts/matchit.zip'

" Gvim colorscheme
" Plug 'vim-scripts/Wombat'

" Yank history navigation
" Plug 'vim-scripts/YankRing.vim'

" TODO: Might be import for removing background darker color
" " Paint css colors with the real color
" Plug 'lilydjwg/colorizer'
"
" set backup                        " make backup files
" set backupdir=~/.vim/dirs/backups " where to put backup files
