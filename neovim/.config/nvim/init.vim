" Basics
filetype plugin indent on
syntax on

set title
set number
set termguicolors
set mouse=a

" Vim Plugins / vim-plug
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chaimleib/vim-renpy'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vinegar'

" Skim
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

call plug#end()

" Airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'

" Theme.
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

" Personals
let mapleader = ';'
let maplocalleader = '\\'

" Netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Uppercase a word and leave the cursor at the end of the word.
inoremap <c-u> <esc>viwUei
nnoremap <c-u> viwUe

" Edit $MYVIMRC
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Surround a word with quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" Sorround a visual selection with quotes
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
" Surround a word with Chinese quote
nnoremap <leader>[ viw<esc>a「<esc>bi」<esc>lel
nnoremap <leader>] viw<esc>a『<esc>bi』<esc>lel
" Surround a visual selection with Chinese quote
vnoremap <leader>[ <esc>`<i「<esc>`>la」<esc>
vnoremap <leader>] <esc>`<i『<esc>`>la』<esc>

" [R]e-[S]et `[f]iletype'.
" This works by setting `filetype' to &filetype.
"
" It is useful because by doing this, your filetype codes are reloaded. 
nnoremap <leader>rsf :execute "set filetype=" . &filetype

" Filetype specific settings
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-* setfiletype mail
  autocmd BufRead,BufNewFile *mutt-* set tw=72
augroup END

set background=dark
