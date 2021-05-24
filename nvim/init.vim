call plug#begin('~/.vim/plugged')
" Plug 'jaredgorski/spacecamp'
" Plug 'junegunn/vader.vim'
" Plug 'morhetz/gruvbox'
" Plug 'https://github.com/joshdick/onedark.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'https://github.com/rafi/awesome-vim-colorschemes'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'https://github.com/tpope/vim-markdown.git'
" Plug 'dense-analysis/ale'

Plug 'dbeniamine/cheat.sh-vim'
Plug 'puremourning/vimspector'
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

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
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
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set hlsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set encoding=utf-8

colorscheme monokai
set background=light
" transparent
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none
" or, if you want to keep this settings after changing the colorscheme:
" au ColorScheme * hi Normal ctermbg=none guibg=none
" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

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

set shell=/bin/bash
" should be placed at the top
" set shell=fish
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
" nnoremap <leader>tsc :w<cr>:silent exec "!tsc %"<cr>
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
" map <leader>ss :setlocal spell!<cr>


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree no matter what
"autocmd vimenter * NERDTree

" Open NERDTree automatically when vim starts if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | else | :call Maybe()  |  endif
" fun! Maybe()
"   NERDTree
"   :wincmd l
" endfun

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
" let g:lightline.mode_map = {
" 		    \ 'n' : 'N',
" 		    \ 'i' : 'I',
" 		    \ 'R' : 'R',
" 		    \ 'v' : 'V',
" 		    \ 'V' : 'V-L',
" 		    \ '\<C-v>': 'V-B',
" 		    \ 'c' : 'C',
" 		    \ 's' : 'S',
" 		    \ 'S' : 'S-L',
" 		    \ '\<C-s>': 'S-B',
" 		    \ 't': 'T',
" 		    \ }
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
" => SimpylFold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold/unfold
nmap <leader>f za
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring=0

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
" set cmdheight=2

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => telescope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>tg <cmd>lua require('telescope.builtin').live_grep()<cr>
