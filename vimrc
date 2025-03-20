scriptencoding utf-8
set fileformats=unix,dos,mac
colo benecolors
set hidden
set nowritebackup
set nobackup

set virtualedit=block
set whichwrap=b,s,[,],<,>

set autoindent
set smartindent
set ignorecase
set smartcase
set formatoptions+=mMj

set omnifunc=syntaxcomplete#Complete
set foldmethod=manual
set foldtext=MyFoldText()                                 
set foldcolumn=0
set nonu

set noerrorbells
set showcmd
set title
set nowrap
set ts=2
set sw=2
set sts=2
set nuw=3 

set makeprg=./alltests.py
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P 

let g:PHP_IndentFunctionCallParameters = 1
let g:php_htmlInStrings = 1

"------------------Menu stuff ------------------------<
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>

"============ autocommands =============


" ============= abreviatioms ============

iab ifph if(cond == False){<CR>}else{<CR>}<CR>
iab ifpy if cond == False:<CR>pass<CR><BS><BS><BS><BS>else:<CR>pass<CR><BS><BS><BS><BS>
iab classpy class MyClass:<CR>def __init__(self):<CR>
iab defpy def func(x,y):<CR>pass<cr>
"Custom fold text ------------------------------
function MyFoldText()                                     
  let line = getline(v:foldstart)                         
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:foldend."->". sub                               
endfunction                                               



" TAB :  Clever tab: ins tab on empty line, auto complete otherwise 
function! CleverTab()
	   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	      return "\<Tab>"
	   else
	      return "\<C-N>"
	   endif
	endfunction
	


function DoAction(id, result)
	if a:result == 1
		PyTest
	elseif a:result == 2
    exe "vert term php -S localhost:8080'"
	elseif a:result == 3
		pedit '<cWORD>'
	elseif a:result == 4
		split ~/.vimrc
	elseif a:result == 5
		ilist /TODO/
	endif
endfunction

function CustomMenuDialog()
	let winid = popup_menu(['Run the current python file in a new terminal window',
		    \ 'Run the current lua file in a new terminal window',
				\ 'Start PHP webserver',
				\ 'Edit filename under cursor inside *preview window*',
				\ 'Edit user .vimrc file',
				\ 'Display TODO items'],	      
				\ #{callback:'DoAction'})
endfunction

" -------- TODO Popup dialog for definition of keyword under cursor =---------  
"  ( Ctrl-D in insert mode)
if !has('nvim')
au! CursorHold * nested call PopupDeclaration()
function PopupDeclaration()
	let [lnum,col] = searchpos(expand("<cword>"),'wn')
	let g:winid = popup_atcursor(string(lnum).": ".getline(lnum)->trim(), #{})
endfunction
endif
"[ctrl-s]
"----------------sign stuff: put a mark and sign together. The sign text is the char to use
" TODO make exit function that saves signs
" TODO make it so that typing a prev. assigned char actually moves to it ...
" i.e. goto char if it exists
function SignMark()
	let s:char = input("Character:")
" char is single letter to be used with the 'm' command  
  if s:char->strlen() == 1
		exe "sign define ".s:char."_mrk text=".s:char."→ texthl=Type linehl=PreProc"
		exe "mark ".s:char 
		call sign_place(0, '', s:char.'_mrk', "%",{'lnum' :"."})
  else
		call popup_dialog("Please insert a char (string length greater than 1)")
  endif
endfunction


" -------- Emulate Function key presses in normal mode(<C-F>) 
function! EmulateFunckeys()
	let s:fnum = input("Function Key #")
	if s:fnum
    execute "normal <F".s:fnum.">"
	else
		call popup_dialog("Please insert a number...", #{})
		return ""
	endif
endfunction

" Custom commands --------------------------------------------------:

command PyTest execute("term python ".expand("%")) 
" --------------------------- --->   XXX Custom Keymaps XXX -----------<==========
let mapleader="\\"
nmap <Bar> :PyTest<CR>
noremap <silent><C-T> :tabnew<CR>:Explore<CR>
nmap <silent><C-S> :call SignMark()<CR>

noremap <silent><C-F> :call EmulateFunckeys()<CR>
noremap <F1> :help<CR>
nmap <silent><C-D> :call CustomMenuDialog()<CR>
nmap <C-M> :emenu <C-Z>
inoremap <Tab> <C-R>=CleverTab()<CR>
inoremap <C-D> <C-O>[I
inoremap <C-S-Right> <C-O>>>
inoremap <C-S-Left> <C-O><<

" keys avail.
" ---------
"  nmap `
"  nmap <S-Tab>
"  nmap <C-S-Right>
"  nmap <C-S-Left>
"  nmap _
"  nmap &
" 

