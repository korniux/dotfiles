execute pathogen#infect()
syntax on
filetype plugin indent on
set laststatus=2
set noshowmode
set tabstop=2
set shiftwidth=2
set expandtab
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste'],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent', ],
    \              [ 'fileformat', 'fileencoding', 'filetype', 'gitbranch'] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }


