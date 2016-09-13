set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

let g:pydocstring_enable_mapping = 0

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'vcscommand.vim'
Plugin 'DoxygenToolkit.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'Shougo/neocomplete.vim'
Plugin 'tpope/vim-dispatch'
"Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set wildignore+=*.class,*.o     " ignore these types of files
set wildmenu                    " use a menu to show available matches
set wildmode=longest:full       " match longest common string and show menu

" set highlighting colors to work on dark background (default xterms are black)
" set background=dark

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-l>"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Neocomplete
"let g:neocomplete#enable_at_startup=1
"let g:neocomplete#min_keyword_length=3


" CTAGS Setup
" Look for files named "tags" in the current directory, then .., then ../.., etc...
" Also look in /some/place
" Matches in both files will be shown.
set tags=tags;/

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set number
set hlsearch
" Clear last search highlighting
map <Space> :noh<cr>

" make sure to always write to UNIX file format
set ff=unix

" Ignore whitespace in vimdiff
:set diffopt+=iwhite

nmap <F5> :make\|copen<CR>
nmap <F4> :cclose<CR>

" requires vcscommand
" Do a vimdiff against the file in the repository.
:map cv :VCSVimDiff<CR>:redraw!<CR>
:map cvb :VCSVimDiff qparent<CR>:redraw!<CR>
:map cvu :VCSVimDiff @{u}<CR>:redraw!<CR>
:map cvp :VCSVimDiff HEAD^<CR>:redraw!<CR>

" Paste Toggle
:set pastetoggle=<F10>

map <F3> :Dox<cr>
nmap du :Dox<CR>
nmap dx :DoxUndoc<CR>

filetype plugin on
let g:pydiction_location = '/home/chris/pydiction-1.2/complete-dict'

:set tabpagemax=20



" Inspired by:
" http://vim.wikia.com/wiki/Source_vimrc_and_use_tags_in_a_parent_directory
" Source .../vimrc and ancestor of starting directory.
" useful when you have source tree eight fathom deep,
" an exercise in Vim loops.
let parent=1
let local_vimrc = "vimrc"
while parent <= 20
    if filereadable(local_vimrc)
        "echomsg "sourcing " . local_vimrc
        exe ":so " . local_vimrc
    endif
    let local_vimrc = "../". local_vimrc
    let parent = parent+1
    " TODO: stop at the root on any system and also ~ on Unix.
endwhile
unlet parent local_vimrc

"execute pathogen#infect()

