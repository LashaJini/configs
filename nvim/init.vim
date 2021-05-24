call plug#begin('~/.vim/plugged')
" Plug 'jaredgorski/spacecamp'
" Plug 'puremourning/vimspector'
" Plug 'dbeniamine/cheat.sh-vim'
" Plug 'junegunn/vader.vim'
" Plug 'morhetz/gruvbox'
" Plug 'https://github.com/joshdick/onedark.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'https://github.com/rafi/awesome-vim-colorschemes'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'https://github.com/tpope/vim-markdown.git'
" Plug 'dense-analysis/ale'

Plug 'https://github.com/ap/vim-css-color.git'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-commentary'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" Track the engine.
" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
"            \ Plug 'ryanoasis/vim-devicons'

Plug 'https://github.com/mattn/emmet-vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'

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

colorscheme monokai
set background=light

let mapleader=" "

set nocompatible
filetype plugin indent on

" automatic toggling between line number modes
set nu rnu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" toggle cursorline 
autocmd InsertEnter,InsertLeave * set cul!
set cul

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

" yank code block
nnoremap <leader>yp V$%y
" delete code block
nnoremap <leader>dp V^%d

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

" set shell=/bin/bash
" should be placed at the top
set shell=fish
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

" syntax highlit for .ejs
au BufNewFile,BufRead *.ejs set filetype=html

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


