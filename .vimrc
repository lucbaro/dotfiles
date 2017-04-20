" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
" }}}

" Set some junk {{{
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
"set foldcolumn=0 " Column to show folds
set nofoldenable " Enable folding
"set foldlevel=0 " Close all folds by default
"set foldmethod=syntax " Syntax are used to specify folds
"set foldminlines=0 " Allow folding single lines
"set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
" set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
"set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set nopaste
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set ttymouse=xterm " Set mouse type to xterm
set undofile " Persistent Undo
set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file

set list listchars=tab:\ \ ,trail:· " Display some unwanted chars like trailing whitespaces
set novisualbell " No blinking
set noerrorbells " No noise.
set vb t_vb= " disable any beeps or flashes on error
set noshowmode " Disable mode display because already present in status line

" No BKP files generated
set nowritebackup
set nobackup
" Swap files and undo files location
set swapfile
" Create directory if not exists
if empty(glob("~/.vim/.tmp"))
  call mkdir($HOME."/.vim/.tmp", "p")
endif

set dir=~/.vim/.tmp
set udir=~/.vim/.tmp
" FZF
set rtp+=~/.fzf
" }}}

" Set leader to space
nmap <space> <leader>
nmap <space><space> <leader><leader>

" Shortcuts ------------------------------------------------------------------------

" Circumflex
nnoremap <^> :^<CR>

" ctrl+l to toggle search highlight.
let hlstate=0
nnoremap <c-l> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
"nnoremap <c-l> :set hlsearch!<CR>
let @/ = "" " clear the last used search pattern thx http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting

" Faster navigation: Shift-Up => Go 5 lines above (+equiv for Down, Left and
" Right)
noremap <S-Up> 5k
noremap <S-Down> 5j
noremap <S-Right> 5l
noremap <S-Left> 5h

" Yank to the EOL
nnoremap Y y$

" FZF Shortcut to replace Ctrl-p
nnoremap <c-p> :FZF<CR>

" Fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>

" Save and source current file
nnoremap <leader>ss :w<CR> :source %<CR>
nnoremap <leader>vc :e ~/.vimrc<CR>

" Plug shortcuts
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

" Tagbar toggle
nnoremap <leader>t :TagbarToggle<CR>
" NerdTree toggle
nnoremap <leader>f :NERDTreeToggle<CR>
" Line numbers toggle and GitGutter toggle
nnoremap <leader>n :set invnumber<CR> :GitGutterSignsToggle<CR>
" Pastemod toggle
nnoremap <leader>p :set invpaste<CR>
" Buffers related operations
noremap <leader><Left> :bp<CR>
noremap <leader><Right> :bn<CR>
noremap <leader>w :bdelete<CR>
" Switch in a buffer by name
noremap <leader>b :Buffers<CR>

" nnoremap <CR> <C-]>
" nnoremap <BS> <C-T>

" Paste mode {{{
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
" }}}

" Functions ------------------------------------------------------------------------

" Restore last position
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

" Check for colorscheme existence
function! HasColorscheme(name)
  return !empty(globpath(&rtp, 'colors/'.a:name.'.vim'))
endfunction

" Plugin Configuration -------------------------------------------------------------

" Airline.vim {{{
augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

" Syntastic.vim {{{
if exists("*SyntasticStatuslineFlag")
  augroup syntastic_config
    autocmd!
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'

    " Swift
    let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
    " PHP
    let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
    " JS
    let g:syntastic_javascript_checkers = ['eslint']
    " SQL
    let g:syntastic_sql_checkers = ['sqlint']
    "let g:syntastic_Handlebars_checkers = ['handlebars']

    let g:syntastic_mode_map = { 'mode': 'active',
          \ 'active_filetypes': ['javascript', 'sql'],
          \ 'passive_filetypes': [] }
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
  augroup END
endif
" }}}

" vim-github-dashboard {{{
augroup vim_github_dashboard_config
  autocmd!
  let g:github_dashboard = { 'username': 'lucbaro' }
augroup END
" }}}

" YouCompleteMe {{{
augroup you_complete_me
  autocmd!
  " let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
augroup END
" }}}

" TagBar {{{
augroup tagbar
  autocmd!
  " Add custom ctags rules for specific languages : https://github.com/majutsushi/tagbar/wiki
  " Markdown
  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
  \ }
augroup END
" }}}

" NERDTree {{{
augroup NERDTree
  autocmd!
  let g:NERDTreeShowHidden = 1
augroup END
" }}}

" Vim-JSX {{{
augroup vimjsx
  autocmd!
  " Enable JSX syntax highlight also on .js files
  let g:jsx_ext_required = 0
augroup END
" }}}

" EasyAlign.vim {{{
augroup easy_align_config
    autocmd!
    xmap <Leader>a <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)
augroup END
" }}}

" RainbowParenthesis.vim {{{
augroup rainbow_parenthesis_config
    autocmd!
    nnoremap <leader>rp :RainbowParenthesesToggle<CR>
augroup END
" }}}

" Match Tag {{{
augroup match_tag
  autocmd!
  nnoremap <leader>ù :MtaJumpToOtherTag<CR>
  let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}
augroup END
" }}}

" EditorConfig {{{
augroup editor_cfg
  autocmd!
  " To ensure that this plugin works well with Tim Pope's fugitive, use the following patterns array:
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']
augroup END
" }}}

" Other config --------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

" VIMRC AUTOCMD -------------------------------------------------------
augroup vimrc
  autocmd!
  " Automatically source VIMRC when writing it
  "au BufWritePost $MYVIMRC source $MYVIMRC " /!\ Bug in vim airline
  " Restore Last cursor position
  au BufWinEnter * call ResCur()
  " Set syntax MySQL when opening sql files
  au BufNewFile,BufRead *.sql set syntax=mysql
  " Handle MySQL CLI editor which opens buffer with pattern path is /tmp/sql*
  au BufNewFile,BufRead /tmp/sql* set syntax=mysql
  " Strip whitespaces automatically when saving PHP/JS files
  au FileType php,javascript au BufWritePre <buffer> StripWhitespace
  " Set indentation per filetype
  au Filetype javascript,javascript.jsx setlocal ts=4 sts=4 sw=4
augroup END

" Plugins -------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    silent !mkdir -p ~/.vim/plugged > /dev/null 2>&1
    silent !mkdir -p ~/.vim/autoload > /dev/null 2>&1
    " Download the actual plugin manager
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Load plugins {{{
call plug#begin('~/.vim/plugged')

" Sessions
Plug 'xolox/vim-session'

" Git stuffs
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-github-dashboard'

" Fuzzy finders & Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" 2-character search motion (s/S).
Plug 'justinmk/vim-sneak'

" Syntax & Comments
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

" Autocompletion & matching
if v:version >= 704 || (v:version == 704 && has("patch143"))
  Plug 'Valloric/YouCompleteMe'
endif
if has('python')
  Plug 'Valloric/MatchTagAlways'
endif

" Tags
" Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
" Plug '/Users/lbaro/Documents/devvim/vim-projects-ctags'
" let g:projectNameList=['vim-projects-ctags']

" Appearence & utils
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

" Text manipulation
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'

" Formatting
Plug 'editorconfig/editorconfig-vim'

" Language specific {
" JavaScript & JSX
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Scala
Plug 'derekwyatt/vim-scala'
" Swift
Plug 'keith/swift.vim'
" JSON manipulation and pretty printing (https://github.com/tpope/vim-jdaddy)
Plug 'tpope/vim-jdaddy'
" Colorize CSS Hex color codes with the associated background color
Plug 'ap/vim-css-color'
" Volt
Plug 'etaoins/vim-volt-syntax'
" Elm
Plug 'lambdatoast/elm.vim'
" TOML
Plug 'cespare/vim-toml'
" }
call plug#end()
" }}}

" Theme ------------------------------------------------------------------------
if HasColorscheme('onedark')
  colorscheme onedark
  " colorscheme badwolf
endif

" Override some styles ---
" BG color
hi Normal ctermbg=232
" Current line BG color
hi CursorLine ctermbg=234
" Search BG color
hi Search ctermbg=67

