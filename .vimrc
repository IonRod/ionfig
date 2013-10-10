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

"MacVim options
if has("gui_running")
	let macvim_skip_colorscheme = 1
	set guioptions-=r
	set guioptions-=L
	set fu
endif
