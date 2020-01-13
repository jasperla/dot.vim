" Load defaults first and override them if applicable
source $VIMRUNTIME/defaults.vim
source ~/.vim/langs.vim

colorscheme plain-cterm

set autochdir
set autoindent
set mouse-=a	" disable all species of mice intervening
set ttymouse=

set nofoldenable " disable all folding

if has('syntax') && has('eval')
	packadd! matchit
endif

let g:netrw_silent = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='minimalist'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0

" Easy navigation of new tabs: https://vim.fandom.com/wiki/Using_tab_pages
nnoremap <C-t> :tabnew<CR>:e ./
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>
