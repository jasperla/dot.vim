" Load defaults first and override them if applicable
source $VIMRUNTIME/defaults.vim

colorscheme smyck

set autochdir
set autoindent
set mouse-=a	" disable all species of mice intervening

set nofoldenable " disable all folding

if has('syntax') && has('eval')
	packadd! matchit
endif

let g:airline_theme='minimalist'
