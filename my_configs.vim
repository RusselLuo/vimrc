" set color schemes
syntax on
color dracula

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
let g:ale_set_balloons = 1
" let g:ale_cursor_detail = 1
let g:ale_set_quickfix = 1
let g:ale_virtualtext_cursor = 1

let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'vim': ['vint'],
\   'rust':['rls','cargo'],
\   'c++': ['ccls']
\}


nmap gd :ALEGoToDefinition<cr>
nmap gr :ALEFindReferences<cr>
nmap gh :ALEHover<cr>
nmap ne :ALENext<cr>
nmap pe :ALEPrevious<cr>
nmap <C-F12> :ALESymbolSearch 

" CRTL-P

let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>


" cpp-highlight

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
