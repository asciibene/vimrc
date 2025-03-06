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

set noerrorbells
set showcmd
set title
set nowrap
set ts=2
set sw=2
set vts=2
set sts=2
set nuw=3 

let g:PHP_IndentFunctionCallParameters = 1
let g:php_htmlInStrings = 1


"Custom fold text ------------------------------
function MyFoldText()                                     
  let line = getline(v:foldstart)                         
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes . sub                               
endfunction                                               



" TAB :  Clever tab: ins tab on empty line, auto complete otherwise 
function! CleverTab()
	   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	      return "\<Tab>"
	   else
	      return "\<C-N>"
	   endif
	endfunction


"------------------Menu stuff ------------------------<
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
" TODO LUA Eval current line.....


" --------- TODO snippets dialog stuff -------------

"------------- TODO LISTS XXXXXXXXXXXXX-------xxxxxxxx XXX LINK With TODO Keyword in text
let g:todoactions = ["New Task","Delete Task"]
let g:todoitems = {} 

function! ActionSelect(id, result)
"use a:result
  if a:result == "New task"
    call popup_dialog("new",#{})
	elseif a:result == "View Tasks"

	elseif a:result == 0 
    
  endif
	
endfunction

function! Todo_MenuDialog()
	let g:popid = popup_menu(g:todoactions,{"callback":'ActionSelect'})
  call popup_close(g:popid)
endfunction

" -------- TODO Popup dialog for definition of keyword under cursor =---------  
"  ( Ctrl-D in insert mode)
function PopupDeclaration()
	let [lnum,col] = searchpos(expand("<cword>"),'wn')
	let g:winid = popup_atcursor(string(lnum).": ".getline(lnum)->trim(), #{})
endfunction
"[ctrl-s]
"----------------sign stuff: put a mark and sign together. The sign text is the char to use
" TODO make exit function that saves signs
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


"----   TODO Dialog & popup stuff to show result of lua expr ------------------
function EvalLuaDialog()
  result = luaeval(s:ex) 
	call popup_dialog(result, f)
endfunction

" -------- Emulate Function key presses in normal mode(<C-F>) 
function! EmulateFunckeys()
	let s:fnum = input("Function Key #")
	if s:fnum
    exe "normal <F".s:fnum.">"
	else
		call popup_dialog("Please insert a number...", #{})
		return ""
	endif
endfunction
 
		" TODO custom exit function (and keymap) to save signs or session.vim or Todo ITEMS

" --------------------------- --->   XXX Custom Keymaps XXX -----------<==========
let mapleader="\\"
nmap <Bar> :call EvalLuaDialog()<CR>
noremap <silent><C-T> :tabnew<CR>:Explore<CR>
nmap <silent><C-S> :call SignMark()<CR>

noremap <silent><C-F> :call EmulateFunckeys()<CR>
noremap <F1> :help<CR>
nmap <silent><C-D> :call Todo_MenuDialog()<CR>
nmap <C-M> :emenu <C-Z>
inoremap <Tab> <C-R>=CleverTab()<CR>
inoremap <C-D> <C-O>:call PopupDeclaration()<CR>
" keys avail.
" ---------
"  nmap `
"  nmap <S-Tab>
"  nmap <C-S-Right>
"  nmap <C-S-Left>
"  nmap _
"  nmap &
" 


