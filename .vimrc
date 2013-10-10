"Pathogen initialisation
execute pathogen#infect()
"Scan all help files using pathogen
Helptags

"Syntax highligh
syntax on
filetype plugin indent on

"Set color sheme
"for MacVim we are to skip this file
colorscheme desert


"---------------------------------------
"My key mapping
let mapleader = ","
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>
nmap <Leader>t :TlistToggle<CR>


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
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
