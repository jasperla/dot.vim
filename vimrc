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

" vimwiki configuration
"
" load index with: `vim -c VimwikiIndex`
" once in the wiki, we can run vim-zettel commands too.
" create a new note: `vim -c VimwikiIndex -c 'ZettelNew note title'`
if has('osx')
  set rtp+=/usr/local/opt/fzf
endif

packadd! vimwiki
packadd! fzf.vim
packadd! vim-zettel

let wiki = {}
let wiki.path = '~/hack/wiw/docs/zettelkasten'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.auto_tags = 1
let wiki.auto_toc = 1
let wiki.auto_chdir = 1
let g:vimwiki_list = [wiki]

let g:zettel_format = "%d%m%Y%H%M-%file_no"
let zettel = {}
let zettel.front_matter = {'tags': ''}
let zettel.template = wiki.path . '/template.tpl'
let g:zettel_options = [zettel]

" Keybindings based on
" https://www.reddit.com/r/Zettelkasten/comments/fidaum/vimzettel_an_addon_for_the_vimwiki_addon_for_vim/
" Search existing tags
nnoremap <leader>vt :VimwikiSearchTags<space>
" Full text search
nnoremap <leader>vs :VimwikiSearch<space>
" Sync tags file and update the index
nnoremap <leader>gt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr><c-l>
" Find and replace the Zettel generated tags (:tagname:)and links
nnoremap <leader>zt /# Generated Tags<cr>vG$dddd:ZettelGenerateTags<cr>
" Search existing notes and insert link
nnoremap <leader>zl :ZettelSearch<cr>
" Create new Zettel
nnoremap <leader>zn :ZettelNew<cr><cr>:w<cr>ggA
" Show incoming links to this file
nnoremap <leader>bl :VimwikiBacklinks<cr>
" Open Wiki index in new tab
nnoremap <leader>ti :VimwikiTabIndex<cr>
