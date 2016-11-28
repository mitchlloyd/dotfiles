""" SETUP PLUGINS """

" Link in go vim plugins
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim

" BEGIN Plug setup https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

" Commands
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPMixed'] }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'zerowidth/vim-copy-as-rtf', { 'on': 'CopyRTF' }
Plug 'tpope/vim-commentary'
Plug 'mcasper/vim-infer-debugger'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Language Specific
Plug 'nono/vim-handlebars'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'othree/html5.vim'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'posva/vim-vue', { 'for': 'vue' }

" Theming
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Misc
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'maxbrunsfeld/vim-yankstack'

call plug#end()

" END Plug setup

filetype plugin indent on
filetype on

" Change the mapleader to comma, which is easier to reach than '\'
let mapleader=","

" Start Mat Stuff
" nmap , ;
" imap ;j <esc>
" map <Leader>d :NERDTreeToggle<CR>
" End Mat Stuff

" Change command for commentary
map <Leader>c  <Plug>Commentary

" Hook up CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <Leader>t :CtrlPMixed<CR>
map <Leader>b :CtrlPBuffer<CR>

" Nerd Tree Binding
map <Leader>n :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

" yankstack bindings
if has("mac") || has("macunix")
  nmap <D-p> <Plug>yankstack_substitute_older_paste
  nmap <D-P> <Plug>yankstack_substitute_newer_paste
endif

syntax on

" Let block visual mode cover virtual space
set virtualedit=block

" Color theme
colorscheme solarized
set background=light
set guioptions=egmrt
let g:solarized_contrast="high"

set nocompatible
set laststatus=2
set guifont=Menlo\ for\ Powerline:h15

" Switch back and forth between buffers
nnoremap <leader><leader> <c-^>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Fast quiting
nmap <leader>q :q<cr>

" Set the cursor line
set cursorline

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Make windows bigger when you move into them
set winwidth=79

" Configure backspace so that it keeps deleting
set backspace=eol,start,indent


""" SEARCHING """

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()


" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set nowrap "Don't wrap lines

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" remember more commands and search history
set history=10000


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


" Delete Trailing Whitespace on Save

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Ignore node_modules directories
set wildignore+=*/.git/*,*/node_modules/**,*/public/assets/source_maps/**,*/vendor/*

set number

" Automatically set the text width in markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Set spell checking for markdown
autocmd BufRead,BufNewFile *.md setlocal spell

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Disable Ex mode
map Q <Nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>r :call RenameFile()<cr>

" Use powerline fonts for airline
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=0
let g:airline_theme='solarized'
let s:airline_theme='solarized'

function! AirlineInit()
  let g:airline_section_a = airline#section#create_left(['mode'])
  let g:airline_section_b = airline#section#create([])
  let g:airline_section_c = airline#section#create(['%<', 'file', ' ', 'readonly'])
  let g:airline_section_gutter = airline#section#create(['%='])
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = ''
  let g:airline_section_warning = airline#section#create(['syntastic', 'eclim', 'whitespace'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

""" Screencasting settings """

" Uncomment to stop cursor blinking
" set guicursor+=a:blinkon0
" set guifont=Menlo\ for\ Powerline:h16

" Remove scrollbar
" set guioptions-=r

" Undo minwidth setting
" set winwidth=1

""" End Screencast Settings """

" Don't break word boundaries by hyphen
set isk+=-

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1

" Give up on validating html files
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" Use ESLint when .eslintrc is available.
" http://stackoverflow.com/questions/28573553/how-can-i-make-syntastic-load-a-different-checker-based-on-existance-of-files-in
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc.js', '.;') != '' ? ['eslint'] : ['jshint']

" For vim-infer-debugger
nmap <Leader>d :call AddDebugger("o")<cr>
nmap <Leader>D :call RemoveAllDebuggers()<cr>

let g:debugger_array = [['\.rb',             'debugger'],
                       \['\.ex$',            'require IEx; IEx.pry'],
                       \['\.exs',            'require IEx; IEx.pry'],
                       \['\.erb',            '<% debugger %>'],
                       \['\.eex',            '<%= require IEx; IEx.pry %>'],
                       \['\.hbs',            '{{debugger}}'],
                       \['\.js$',            'debugger;']]
