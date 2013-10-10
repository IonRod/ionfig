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
nmap <Leader>r :NERDTreeFind<CR>
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
function! SetUpNERDTree()
    if 0 == argc()
        NERDTree
    end
    let NERDTreeShowHidden=1
    map <F2> :NERDTreeToggle<CR>
endfunction

autocmd VimEnter * call SetUpNERDTree()
