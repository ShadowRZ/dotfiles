" Basics
filetype plugin indent on
syntax on

set title
set number
set termguicolors
set mouse=a

" Vim Plugins / vim-plug {{{
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-vinegar'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'vimwiki/vimwiki'

Plug 'lilydjwg/fcitx.vim'

" Skim
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

" deoplete.nvim
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/deoplete-clangx'

" Clang-format
Plug 'rhysd/vim-clang-format'

call plug#end()
" }}}

" Airline theme {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
" }}}

" Theme. {{{
colorscheme dracula
" }}}

" Personals {{{
let mapleader = ';'
let maplocalleader = '\\'

" Netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" deoplete.nvim
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})

" Clang-format
let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
            \ "BasedOnStyle" : "llvm",
            \ "IndentWidth" : 4,
            \ "AllowShortFunctionsOnASingleLine" : "None",
            \ "KeepEmptyLinesAtTheStartOfBlocks" : "false"}

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
nnoremap <leader>rsf :execute "set filetype=" . &filetype <cr>

" Filetype specific settings
augroup filetypedetect
  " Mail
  	autocmd BufRead,BufNewFile *mutt-* setfiletype mail
  	autocmd BufRead,BufNewFile *mutt-* set tw=72
augroup END

augroup ft_setup
	autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
	autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
	autocmd FileType c,cpp,objc ClangFormatAutoEnable
augroup END

nnoremap <Leader>C :ClangFormatAutoToggle<CR>

set background=dark
" }}}
" vim:ft=vim:ts=4:sw=4:foldmethod=marker
