version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <M-C-Right> <Plug>(copilot-accept-line)
imap <M-Right> <Plug>(copilot-accept-word)
imap <M-Bslash> <Plug>(copilot-suggest)
imap <M-[> <Plug>(copilot-previous)
imap <M-]> <Plug>(copilot-next)
imap <Plug>(copilot-suggest) <Cmd>call copilot#Suggest()
imap <Plug>(copilot-previous) <Cmd>call copilot#Previous()
imap <Plug>(copilot-next) <Cmd>call copilot#Next()
imap <Plug>(copilot-dismiss) <Cmd>call copilot#Dismiss()
inoremap <C-U> u
imap <ScrollWheelDown> 
imap <ScrollWheelUp> 
nnoremap <silent>  :nohlsearch=has('diff')?'|diffupdate':''
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
xmap a% <Plug>(MatchitVisualTextObject)
xnoremap gx <ScriptCmd>vim9.Open(getregion(getpos('v'), getpos('.'), { type: mode() })->join())
nnoremap gx <ScriptCmd>vim9.Open(GetWordUnderCursor())
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <silent> <C-L> :nohlsearch=has('diff')?'|diffupdate':''
map <ScrollWheelDown> 
map <ScrollWheelUp> 
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set background=dark
set complete=.,w,b,u,t
set display=lastline
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set formatoptions=tcqmMj
set hidden
set history=1000
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set mouse=a
set nrformats=bin,hex
set omnifunc=syntaxcomplete#Complete
set ruler
set runtimepath=~/.vim,~/.vim/pack/github/start/copilot.vim,/data/data/com.termux/files/usr/share/vim/vimfiles,/data/data/com.termux/files/usr/share/vim/vim91,/data/data/com.termux/files/usr/share/vim/vim91/pack/dist/opt/netrw,/data/data/com.termux/files/usr/share/vim/vim91/pack/dist/opt/matchit,/data/data/com.termux/files/usr/share/vim/vimfiles/after,~/.vim/after
set scrolloff=1
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
set shiftwidth=2
set showcmd
set sidescrolloff=5
set smartcase
set smartindent
set smarttab
set softtabstop=2
set tabpagemax=50
set tabstop=2
set tags=./tags;,./TAGS,tags,TAGS
set title
set ttimeout
set ttimeoutlen=100
set vartabstop=2
set viminfo=!,'100,<50,s10,h
set virtualedit=block
set whichwrap=b,s,[,],<,>
set wildignore=*.pyc
set nowritebackup
set nowrap
" vim: set ft=vim :

command PythonTest terminal python exp("%:p:h")

nmap <C-T> :call CustomDialog()<CR>
nmap <C-Y> :PythonTest<CR>

def CustomDialog(): bool
 call popup_menu(['Run py file', 'New explore tab'], {})


enddef
