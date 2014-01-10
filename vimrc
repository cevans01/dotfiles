" CTAGS Setup
" Look for files named "tags" in the current directory, then .., then ../.., etc...
" Also look in /some/place
" Matches in both files will be shown.
set tags=tags;/,/some/place


" Ignore whitespace in vimdiff
:set diffopt+=iwhite


" requires vcscommand
" Do a vimdiff against the file in the repository.
:map cv :VCSVimDiff<CR>:redraw!<CR>

filetype plugin on
let g:pydiction_location = '/home/chris/pydiction-1.2/complete-dict'

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set number
" Clear last search highlighting
"
" map <Space> :noh<cr>
