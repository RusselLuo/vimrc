" set number hybrid
set number relativenumber

" set column color
highlight ColorColumn ctermbg=yellow

" set column
set colorcolumn=80

" NERDTREE
let g:NERDTreeWinPos = 'left'

"ale
let g:ale_completion_enabled=1
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 1

let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'vim': ['vint'],
\   'rust':['rls','cargo']
\}
