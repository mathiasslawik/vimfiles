let mapleader = ','

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

filetype on
au BufNewFile,BufRead *.yml set filetype=ansible

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

if has('gui_running')
  set guioptions-=T  " no toolbar
  set lines=60 columns=108 linespace=0
  if has('gui_win32')
    au GUIEnter * simalt ~x
    set guifont=Source_Code_Pro_Semibold:h14:cANSI:qDRAFT
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
endif

let g:vimtex_view_general_viewer = 'c:\local\SumatraPDF\SumatraPDF.exe'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf -inverse-search "gvim --servername ' . v:servername
                \ . ' --remote-send \"^<C-\^>^<C-n^>'
                \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
                \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':call remote_foreground('''.v:servername.''')^<CR^>\""'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

set autochdir

" Use one space, not two, after punctuation.
set nojoinspaces

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remap keys on German keyboards
map ü <C-]>
map ö [
map ä ]
map Ö {
map Ä }
map ß /

filetype plugin indent on

set bri

" Set spellfile to location that is guaranteed to exist
set spellfile=$HOME/vimfiles/.vim-spell-en.utf-8.add

:command! -bar SpellEn set spelllang=en spellfile=$HOME/vimfiles/.vim-spell-en.utf-8.add spell
:command! -bar SpellDe set spelllang=de spellfile=$HOME/vimfiles/.vim-spell-de.utf-8.add spell

nnoremap <Leader>s ]s
nnoremap <Leader>a zg]s 

" Use smart case by default (ignore case when only lowercase characters)
set smartcase

" Ignore junk files for CTRL-P completion
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|^.git$\|_site'

set background=dark

set encoding=utf-8

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Map F2 and F3 to toggling line numbers
:set number
noremap <F2> :set invnumber<CR>
inoremap <F2> <C-O>:set invnumber<CR>
noremap <F3> :set invrelativenumber<CR>
inoremap <F3> <C-O>:set invrelativenumber<CR>

" Map F4 to showing NERDTree
noremap <F4> :NERDTreeToggle<CR>
inoremap <F4> <Esc><F4>

" Map F5 to toggling autosave
noremap <F5> :let g:auto_save = ! g:auto_save<CR>
inoremap <F5> <Esc><F5>


let g:auto_save_events = ["InsertLeave", "TextChanged"]

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

set exrc

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

execute pathogen#infect()
call pathogen#helptags()

colorscheme railscasts
let g:airline_theme="durant"
let g:airline_powerline_fonts = 1

syntax on
set secure
