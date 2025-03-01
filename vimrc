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
set scrolloff=1
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
set shiftwidth=2
set showcmd
set sidescrolloff=5
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabpagemax=50
set tabstop=4
set tags=./tags;,./TAGS,tags,TAGS
set title
set ttimeout
set ttimeoutlen=100
set vartabstop=4
set viminfo=!,'100,<50,s10,h
set virtualedit=block
set whichwrap=b,s,[,],<,>
set wildignore=*.pyc
set nowritebackup
set nowrap
" vim: set ft=vim :
colo benecolors

command PythonTest terminal python exp("%")

nmap <C-T> :call CustomDialog()<CR>
nmap <C-P> :PythonTest<CR>

func CustomDialog()
  let res = popup_menu(['Run py file', 'New explore tab'], #{})
  call popup_dialog(string(res), {})
  return res

endfunction
