"Pathogen initialisation
execute pathogen#infect()
"Scan all help files using pathogen
Helptags

"Set node dict
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

"Node omnicompletition
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"Remap omnicomplete
"imap <c-space> <c-x><c-o> 

"Syntax highligh
syntax on
filetype plugin indent on

"Set color sheme
"for MacVim we are to skip this file
colorscheme desert

"Set autoindets
set smartindent

"Search settings
set incsearch
set smartcase

"Automatically set current dir to files path
set autochdir

"Map CTRL+W n to open vertically
nmap <C-W>n :vne<CR>

"Set tabulation as 4 spaces
set ts=4

"Encodings
set encoding=utf-8                                  " set charset translation encoding
set termencoding=utf-8                              " set terminal encoding
set fileencoding=utf-8                              " set save encoding
set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le   " 

"---------------------------------------
"My key mapping
let mapleader = ","
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
nmap <Leader>t :TlistToggle<CR>

"Map <esc> to jk
inoremap jk <esc>

"Ctrl+s to save document
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>


"---------------------------------------
"MacVim settings
if has("gui_macvim")
	let macvim_skip_colorscheme = 1
	set guioptions-=r
	set guioptions-=L
	set fu
endif


"---------------------------------------
"NERDTree settings

"Open NERDTree at startup if no file passed to open
"function! SetUpNERDTree()
    "if 0 == argc()
        "NERDTree
    "end
    "let NERDTreeShowHidden=1
    "let NERDTreeChDirMode=1    
"endfunction

"autocmd VimEnter * call SetUpNERDTree()


"---------------------------------------
"Taglist settings
let Tlist_Use_Right_Window   = 1
let Tlist_WinWidth = 50

"---------------------------------------
"Set autoreload .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


"---------------------------------------
"Folding
set foldmethod=indent
" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction


"---------------------------------------
"Close if NERDTree or TagList are the last one

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


"---------------------------------------
"Android sdk
let g:android_sdk_path = '/Users/ionrod/DevTools/android_sdk' 
