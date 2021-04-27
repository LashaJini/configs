" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set incsearch		" Incremental search
"set hlsearch
"set ttyfast
"set scrolloff=5
"syntax on
"set laststatus=2
"set showmode
"set number
"set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\ %{strftime('%d/%m/%y\ %H:%M:%S')}
"set encoding=utf-8

"set tabstop=4

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

" syntax on

set encoding=UTF-8

set showcmd
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
"set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set encoding=utf-8


call plug#begin('~/.vim/plugged')
" .graphql .graphqls .gql
Plug 'jparise/vim-graphql'

Plug 'digitaltoad/vim-pug'
" Plug 'dracula/vim', { 'as': 'dracula' }
" colorscheme: spacecamp
Plug 'jaredgorski/spacecamp'

Plug 'puremourning/vimspector'
Plug 'dbeniamine/cheat.sh-vim'

Plug 'https://github.com/ap/vim-css-color.git'
Plug 'junegunn/vader.vim'

Plug 'szw/vim-maximizer'

Plug 'morhetz/gruvbox'
Plug 'https://github.com/joshdick/onedark.vim'

" Plug 'jremmen/vim-ripgrep'
" git wrapper
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"Plug 'leafgarland/typescript-vim'
" Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags' " C++
" Plug 'ycm-core/YouCompleteMe'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
"Plug 'mbbill/undotree'

" Track the engine.
" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
"            \ Plug 'ryanoasis/vim-devicons'

" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" HTML && CSS snippets
Plug 'https://github.com/mattn/emmet-vim'
"Plug 'https://github.com/rafi/awesome-vim-colorschemes'
" Color schemes
Plug 'flazz/vim-colorschemes'

" React syntax
Plug 'maxmellon/vim-jsx-pretty'
" Markdown
Plug 'https://github.com/tpope/vim-markdown.git'
" Js
" Plug 'https://github.com/pangloss/vim-javascript.git'
" Js-lib
" Plug 'crusoexia/vim-javascript-lib'
" TypeScript
" Plug 'https://github.com/HerringtonDarkholme/yats.vim.git'

" for statusbar
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'dense-analysis/ale'

" Py code colding
Plug 'tmhedberg/SimpylFold'
" Search from vim
Plug 'ctrlpvim/ctrlp.vim'

Plug 'beautify-web/js-beautify'
Plug 'maksimr/vim-jsbeautify'

" Rust
Plug 'rust-lang/rust.vim'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"set runtimepath^=~/.vim/bundle/ctrlp.vim

" colorscheme materialbox
" colorscheme sole
" colorscheme enigma
" colorscheme solarized8_dark_flat
" colorscheme solarized8_dark_high
" colorscheme solarized8_dark_low
" colorscheme solarized8_dark
" colorscheme solarized8_light
" colorscheme solarized8_light_flat
" colorscheme solarized8_light_high
" colorscheme solarized8_light_low
" colorscheme gruvbox
" colorscheme onedark
colorscheme monokai
" colorscheme spacecamp
" colorscheme spacecamp_lite
" colorscheme dracula

" set background=dark
set background=light
let mapleader=" "

if executable('rg')
    let g:rg_derive_root='true'
endif

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:netrw_browse_split=2
" let g:netrw_banner=0
" let g:netrw_winsize=25
" let g:ctrlp_use_caching=0

" sed -n l
execute "set <M-1>=\e1"
execute "set <M-2>=\e2"
execute "set <M-3>=\e3"
execute "set <M-4>=\e4"
execute "set <M-5>=\e5"
execute "set <M-6>=\e6"
execute "set <M-7>=\e7"
execute "set <M-8>=\e8"
execute "set <M-9>=\e9"
nnoremap <M-1> 1gt :call CD()<cr>
nnoremap <M-2> 2gt :call CD()<cr>
nnoremap <M-3> 3gt :call CD()<cr>
nnoremap <M-4> 4gt :call CD()<cr>
nnoremap <M-5> 5gt :call CD()<cr>
nnoremap <M-6> 6gt :call CD()<cr>
nnoremap <M-7> 7gt :call CD()<cr>
nnoremap <M-8> 8gt :call CD()<cr>
nnoremap <M-9> 9gt :call CD()<cr>

inoremap <M-1> <Esc>1gt :call CD()<cr>
inoremap <M-2> <Esc>2gt :call CD()<cr>
inoremap <M-3> <Esc>3gt :call CD()<cr>
inoremap <M-4> <Esc>4gt :call CD()<cr>
inoremap <M-5> <Esc>5gt :call CD()<cr>
inoremap <M-6> <Esc>6gt :call CD()<cr>
inoremap <M-7> <Esc>7gt :call CD()<cr>
inoremap <M-8> <Esc>8gt :call CD()<cr>
inoremap <M-9> <Esc>9gt :call CD()<cr>

"nnoremap <C-@> i
"inoremap <C-@> <Esc>
"vnoremap <C-@> <Esc>

inoremap <C-v>a1 <C-v>u0101
inoremap <C-v>a2 <C-v>u00e1
inoremap <C-v>a3 <C-v>u01ce
inoremap <C-v>a4 <C-v>u00e0

inoremap <C-v>i1 <C-v>u012b
inoremap <C-v>i2 <C-v>u00ed
inoremap <C-v>i3 <C-v>u01d0
inoremap <C-v>i4 <C-v>u00ec

inoremap <C-v>e1 <C-v>u0113
inoremap <C-v>e2 <C-v>u00e9
inoremap <C-v>e3 <C-v>u011b
inoremap <C-v>e4 <C-v>u00e8

inoremap <C-v>u1 <C-v>u016b
inoremap <C-v>u2 <C-v>u00fa
inoremap <C-v>u3 <C-v>u016d
inoremap <C-v>u4 <C-v>u00f9

set nocompatible
filetype plugin indent on

" turn hybrid line numbers on
"set number relativenumber
"set nu rnu
" turn hybrid line numers off
"set nonumber norelativenumber
"set nonu nornu
" toggle hybrid line numbers
"set number! relativenumber!
"set nu! rnu!

" automatic toggling between line number modes
set nu rnu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END


" toggle cursorline 
autocmd InsertEnter,InsertLeave * set cul!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nnoremap <leader>w :w<cr>
nnoremap <leader>aw :wa<cr>
" Fast quit
" nmap <leader>q :q<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>aq :qa<cr>

" Yank to x register
nnoremap <leader>x "xyy
vnoremap <leader>x "xy
" Paste x register
nnoremap <leader>xp "xp
" Append to x register
nnoremap <leader>X "Xyy
vnoremap <leader>X "Xy

set langmap=აa,იi,ბb,წw,ფf,ოo,OO,AA,II,პp,PP,ეe,რr,ღR,ყy,უu,დd,DD,გg,GG,ჰh,ჯj,კk,ლl,ხx,ცc,ჩC,ვv,VV
" list buffers
" nmap <leader>ls  :ls<cr>

" remove default --INSERT--, etc
set noshowmode

" Open horizontal terminal window
nmap <leader>t<cr> :call OpenTerminal(1, 0, 0)<cr>
" Open vertical terminal window and swap with next window
nmap <leader>vt :call OpenTerminal(0, 0, 0)<cr>
" Compile/run/execute current file
nmap <leader>run :call ExecuteCurrentFile(1, 1)<cr>
nmap <leader>vrun :call ExecuteCurrentFile(0, 1)<cr>

" set shell=fish
set shell=/bin/bash
" should be placed at the top
" if &shell =~# 'fish$'
"     set shell=sh
" endif
fun! ExecuteCurrentFile(horizontal, shell)
  let extension = expand("%:e")
  let filename = expand("%:t:r")
  let executed = ''
  w
  if extension == 'rs'
    let executed = printf('rustc %% -o %s && ./%s && rm %s', filename, filename, filename)
  elseif extension == 'c'
    let executed = printf('gcc %% -o %s -O -g -Wall && ./%s && rm %s', filename, filename, filename)
  elseif extension == 'cpp'
    let executed = printf('gcc %% -xc++ -lstdc++ -shared-libgcc -O -g -Wall -o %s && ./%s && rm %s', filename, filename, filename)
  elseif extension == 'js'
    let executed = printf('node %%')
  elseif extension == 'ts'
    let executed = printf('deno run %%')
  elseif extension == 'py'
    let executed = printf('python3 %%')
  elseif extension == 'sh'
    let executed = printf('sh %%')
  elseif extension == 'java'
    let executed = printf('javac -cp . %% && java -cp . %s && rm *.class', filename)
  elseif extension == ''
    echo '[!!] Warning. No extension found.'
    return
  else
    echo "[!!] Warning. Can't run/compile/build extension: " . extension
    return
  endif
  call OpenTerminal(a:horizontal, a:shell, executed)
endfun

fun! OpenTerminal(horizontal, shell, args)
  if a:horizontal
    if !a:shell
      ter ++rows=12
    else
      execute "ter ++shell ++rows=12 " . a:args
    endif
  else
    if !a:shell
      vert ter
    else
      execute "vert ter ++shell " . a:args
    endif
    wincmd x
    wincmd l
  endif
endfun

" Cargo
nnoremap <leader>cg :w<cr>:call OpenTerminal(1, 1, 'cargo run')<cr>
nnoremap <leader>tcg :w<cr>:call OpenTerminal(1, 1, 'cargo test')<cr>
nnoremap <leader>vcg :w<cr>:call OpenTerminal(0, 1, 'cargo run')<cr>
nnoremap <leader>tvcg :w<cr>:call OpenTerminal(0, 1, 'cargo test')<cr>
nnoremap <leader>check :w<cr>:call OpenTerminal(1,1,'cargo check')<cr>
" rust wasm
nnoremap <leader>wasm :w<cr>:call OpenTerminal(1,1, 'wasm-pack build')<cr>
nnoremap <leader>vwasm :w<cr>:call OpenTerminal(0,1, 'wasm-pack build')<cr>
" Deno
nnoremap <leader>deno :w<cr>:call OpenTerminal(1, 1, 'deno run %')<cr>
nnoremap <leader>vdeno :w<cr>:call OpenTerminal(0, 1, 'deno run %')<cr>
" Node
nnoremap <leader>node :w<cr>:call OpenTerminal(1, 1, 'node %')<cr>
nnoremap <leader>vnode :w<cr>:call OpenTerminal(0, 1, 'node %')<cr>
" tsc
nnoremap <leader>tsc :w<cr>:silent exec "!tsc %"<cr>
nnoremap <leader>tr :w<cr>:call TranspileJS()<cr>
" nnoremap <leader>tr :w<cr>:call Something | redraw<cr>
function! TranspileJS()
  let extension = expand("%:e")
  let filename = expand("%:t:r")
  let js = filename . ".js"

  " let command1 = printf("!mkdir -p js && tsc --outFile js/%s %%", js)
  " exe command1
  " redraw
  let command2 = printf("mkdir -p js && tsc --outFile js/%s %% && echo '** Transpiled! **' && deno run %%", js)
  call OpenTerminal(1, 1, command2)
endfunction


" Echo cwd
nnoremap <leader>pwd :pwd<cr>

" Jump to mark 1 (col)
nnoremap <leader>1 `1
nnoremap <leader>2 `2
nnoremap <leader>3 `3

" Switch to next buffer
nnoremap <leader>bn :bnext<cr>

" Sometimes I forget to mark lines...
" nnoremap <leader>G :ma 3<cr>:%<cr>
" map <leader>gg :call MarkAndGoToLine(2, 1)<cr>
" map <leader>G :call MarkAndGoToLine(3, "%")<cr>

nnoremap gg :call MarkAndGoToLine(2, 1)<cr>
nnoremap G :call MarkAndGoToLine(2, '%')<cr>
fun! MarkAndGoToLine(markSymbol, lineNum)
  execute "normal! m" . a:markSymbol
  execute a:lineNum
endfun

" tmap <c-@> <c-\><c-n><c-w>k
tmap <c-@> <c-\><c-n>

set foldmethod=indent
set foldlevel=99

nnoremap <leader>o <C-o>
nnoremap <leader>i <C-i>

" set clipboard=unnamed
" YEEEEEEEEEEEEEEEEEEEEES
set clipboard=unnamedplus

" Coconut oil ;)
vmap <leader>pd "_dP

" 
nmap do ddO
nmap dfi f}i<cr><Esc>O

" function! ADC()
"   let filename = input('Filename: ')
"   let constraints = filename + '.constraints.md'
"   let ideas = filename + '.ideas.md'
"   let test = filename + '.test.ts'
"   let main = filename + '.ts'

"   execute printf('%s', main)
" endfunction
" nmap <leader>adc :call ADC()<cr>

" syntax highlit for .ejs
au BufNewFile,BufRead *.ejs set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 5 lines to the cursor - when moving vertically using j/k
set so=5

" Turn on wild menu
set wildmenu

" Height of the command bar
set cmdheight=1

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Add a bit extra margin to the left
"set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <leader>j <C-W>j
map <leader>h <C-W>h
map <leader>k <C-W>k
map <leader>l <C-W>l

" Go to N previous window
map <leader><tab> <C-W>w
" Go to previously accessed window
map <leader>p<cr> <C-W>p
" Open window in new tab
map <leader>T <C-W>T
" Equalize windows
map <leader>= <C-W>=
nnoremap <silent> + :resize +1<cr>
nnoremap <silent> - :resize -1<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :call CD()<cr>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Splitting
map <leader>\ <C-W>v
map <leader>- :split<cr>

" Create new file
nmap <leader>vc<cr> <c-w>v<c-w>l :e 
" map <leader>bb <c-w>v<c-w>l :e /tmp/buffer<cr>i

"""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" set statusline=%F%m%r%h%w\ CWD:\ %r%{getcwd()}\ [POS=%l,%v][%p%%]\ %{strftime('%d/%m/%y\ %H:%M:%S')}

fun! CD()
cd %:p:h
pwd
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
let save_cursor = getpos(".")
let old_query = getreg('/')
silent! %s/\s\+$//e
call setpos('.', save_cursor)
call setreg('/', old_query)
endfun

if has("autocmd")
autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>    

set splitbelow

" Open scratch buffer on split
map <leader>bb <c-w>v<c-w>l :e /tmp/buffer<cr>i

" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
"map <leader>x :e ~/buffer.md<cr>

" Fullstack dev
" au BufNewFile,BufRead *.js, *.html, *.css
"     \ set tabstop=2
"     \ set softtabstop=2
"     \ set shiftwidth=2

" Spot and remove whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" auto closing curly braces
inoremap {<CR> {<CR>}<Esc>ko
" inoremap { {}<Esc>i
" auto closing brackets
inoremap [<CR> [<CR>]<Esc>ko
" inoremap [ []<Esc>i
" auto closing parentheses
" inoremap ( ()<Esc>i
" inoremap (<esc> ()
inoremap (<cr> (<cr>)<Esc>ko

inoremap ({<CR> ({<CR>})<Esc>ko
inoremap ([<CR> ([<CR>])<Esc>ko
inoremap {[<CR> {[<CR>]}<Esc>ko
inoremap [{<CR> [{<CR>}]<Esc>ko
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-@>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree no matter what
"autocmd vimenter * NERDTree

" Open NERDTree automatically when vim starts if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | else | :call Maybe()  |  endif
fun! Maybe()
  NERDTree
  :wincmd l
endfun

" move cursor on left window instead of NERDTree window
" autocmd vimenter * wincmd l

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" refresh nerdtre
nmap <Leader>r<cr> :NERDTreeFocus<cr>R<c-w><c-p>

"let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'spell' ],
      \             [ 'fugitive', 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'cwd', 'fileformat', 'fileencoding', 'filetype', 'mea' ] ] 
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'cwd' ] ] 
      \ },
      \
      \ 'component':{
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%#ModifiedColor#%{LightlineModified()}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
			\ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'component_function':{
      \   'mea': 'DateNow',
      \   'cwd': 'CWD',
      \   'filename': 'LightLineFilename'
      \ },
      \ }
let g:lightline.mode_map = {
		    \ 'n' : 'N',
		    \ 'i' : 'I',
		    \ 'R' : 'R',
		    \ 'v' : 'V',
		    \ 'V' : 'V-L',
		    \ "\<C-v>": 'V-B',
		    \ 'c' : 'C',
		    \ 's' : 'S',
		    \ 'S' : 'S-L',
		    \ "\<C-s>": 'S-B',
		    \ 't': 'T',
		    \ }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }

function! DateNow()
  return strftime('%d/%m/%y %H:%M:%S')
endfunction

function! CWD()
  return ""
  " return getcwd()
endfunction

function! LightLineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineModified()
  let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
  let mode = get(map, mode()[0], mode()[0])
  let bgcolor = {'n': [240, '#585858'], 'i': [31, '#0087af']}
  let color = get(bgcolor, mode, bgcolor.n)
  exe printf('hi ModifiedColor ctermfg=196 ctermbg=%d guifg=#ff0000 guibg=%s term=bold cterm=bold',
  \ color[0], color[1])
  return &modified ? '+' : &modifiable ? '' : '-'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. You need to change this to something else than
" <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gruvbox_contrast_dark="medium"
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_light="soft"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
    \ 'rust': ['analyzer', 'cargo', 'rls', 'rustc'],
    \ 'javascript': ['eslint']
    \ }
let g:ale_fixers = {
    \ '*': ['trim_whitespace'],
    \ 'javascript': ['prettier-eslint', 'eslint', 'importjs'],
    \ }
let g:ale_linters_ignore = {'typescript': ['eslint', 'standard', 'tslint', 'tsserver', 'typecheck', 'xo']}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" map <leader>af :ALEFindReferences<cr>
" map <leader>ag :ALEGoToDefinition<cr>
map <leader>ap :ALEPrevious<cr>
map <leader>an :ALENext<cr>
map <leader>ad :ALEDetail<cr>
"ALEGoToTypeDefinition
let g:ale_completion_enabled=0
" let g:ale_typescript_tsserver_use_global=1
" let g:ale_typescript_tsserver_config_path='~/github/configs/vim/coc/tsconfig.json'
let g:ale_pattern_options = {'\.ts*$': {'ale_enabled': 0}}
let g:ale_open_list=0
let g:ale_lint_on_save=0
let g:ale_keep_list_window_open = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SimplyFold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold/unfold
nmap <leader>f za
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<cr>
" map <leader>d :YcmCompleter GetDoc<cr><c-w>j

" let g:ycm_global_ycm_extra_conf = '/root/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/rust/rust_completer.py'
" YouCompleteMe and UltiSnips compatibility.
" let g:ycm_use_ultisnips_completer = 1
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

" Expand snippets from UltiSnips with tab
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
" let g:UltiSnipsSnippetDirectories = ['UltiSnips']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PY stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key C-y
" enable only for css & html
" let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" let g:user_emmet_leader_key='<C-q>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <C-p>
" can search with acronyms as well
" <C-t> open in new tab
" <C-v> <C-s> split
" let g:ctrlp_user_command = ['.git/', 'node_modules/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ignore files in .gitigonre
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rust.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help rust
" let g:rustfmt_autosave=1 " automatically calls ale_open_list
" let g:rust_recommended_style = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :CocInstall coc-tsserver
" :CocInstall coc-deno
" :CocInstall coc-prettier " js,ts,css,json
" :CocCommand deno.types
" :CocRestart
"
" Disabling
" :CocList extensions
" <tab> d 
" reset vim

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: '\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" let g:coc_config_home='/root/github/configs/vim/.vim/coc'
let g:coc_config_home='/root/109149/configs/vim/.vim/coc'

nmap <leader>coc<cr> :CocRestart<cr>
nmap <leader>cocd<cr> :CocDisable<cr>
nmap <leader>coce<cr> :CocEnable<cr>

" run :Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" will be automatically installed and updated by Coc.
" let g:coc_global_extensions = [
"   \ 'coc-tsserver'
"   \ ]

function! CloseCocWindows()
  call coc#float#close_all()
endfunction

function! DoCocActions()
  call CloseCocWindows()
  execute "normal \<Plug>(coc-codeaction)"
endfunction

nmap <leader>cocq :call CloseCocWindows()<cr>

" Diagnostics
nnoremap <silent> <leader>cocd :<C-u>CocList diagnostics<cr>
" nmap <silent> <leader>cocd <Plug>(coc-diagnostic-info)

" Fuzzy search symbols
nnoremap <silent> <leader>cocs :<C-u>CocList -I symbols<cr>

" Perform code actions on symbol where cursor stands (importing ...)
" nmap <leader>co <Plug>(coc-codeaction)
nmap <leader>co<cr> :call DoCocActions()<cr>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" kill coc
nmap <leader>cock :call coc#rpc#kill()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-maximizer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" defaults:
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :Test
function! s:exercism_tests()
  if expand('%:e') == 'vim'
    let testfile = printf('%s/%s.vader', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(testfile)
      echoerr 'File does not exist: '. testfile
      return
    endif
    source %
    execute 'Vader' testfile
  else
    let sourcefile = printf('%s/%s.vim', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(sourcefile)
      echoerr 'File does not exist: '. sourcefile
      return
    endif
    execute 'source' sourcefile
    Vader
  endif
endfunction

autocmd BufRead *.{vader,vim}
      \ command! -buffer Test call s:exercism_tests()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Learn vimscript the hard way
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cheat.sh-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>KK - open in pager
" <leader>KB - open in new window
" <leader>KR - replace question with answer
" <leader>Kp - paste answer below question
" <leader>C  - toggle commets
let g:CheatSheetFrameworks = {
                \ 'python' : ['python', 'django', ],
                \ 'javascript' : ['javascript', 'node', 'angular', 'jquery'],
                \}
let g:CheatSheetFrameworkDetectionMethods = {
                \'django' : { 'type' : 'file', 'value' : 'manage.py' },
                \'jquery' : {'type' :'search', 'value' : 'jquery.*\.js'},
                \'node': {'type': 'file', 'value': '*\.js'}
                \}
" gives ?Q to the server if = 0
let g:CheatSheetShowCommentsByDefault=1
" Default query mode
" 0 => buffer
" 1 => replace (do not use or you might loose some lines of code)
" 2 => pager
" 3 => paste after query
" 4 => paste before query
" let g:CheatSheetDefaultMode=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['vscode-cpptools', 'CodeLLDB', 'vscode-node-debug2', 'debugger-for-chrome', 'vscode-bash-debug', 'debugpy', 'vscode-go' ]

fun GoToWindow(id)
  call win_gotoid(a:id)
  " MaximizerToggle
endfun

nnoremap <leader>dd :call vimspector#Launch()<cr>
nnoremap <leader>dc<cr> :call GoToWindow(g:vimspector_session_windows.code)<cr>
nnoremap <leader>dt :call GoToWindow(g:vimspector_session_windows.tagpage)<cr>
nnoremap <leader>dv<cr> :call GoToWindow(g:vimspector_session_windows.variables)<cr>
nnoremap <leader>dw :call GoToWindow(g:vimspector_session_windows.watches)<cr>
nnoremap <leader>ds :call GoToWindow(g:vimspector_session_windows.stack_trace)<cr>
nnoremap <leader>do :call GoToWindow(g:vimspector_session_windows.output)<cr>
nnoremap <leader>de<cr> :call vimspector#Reset()<cr>

nnoremap <leader>dvclb :call vimspector#CleanLineBreakpoint()<cr>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>dn :call vimspector#Continue()<cr>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
