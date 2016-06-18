let mapleader = ','

execute pathogen#infect()
call pathogen#helptags()

" Exit vim if last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

syntax on
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

colorscheme railscasts

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

filetype plugin indent on

set bri

" Set spellfile to location that is guaranteed to exist
set spellfile=$HOME/vimfiles/.vim-spell-en.utf-8.add

:command! -bar SpellEn set spelllang=en spellfile=$HOME/vimfiles/.vim-spell-en.utf-8.add spell
:command! -bar SpellDe set spelllang=de spellfile=$HOME/vimfiles/.vim-spell-de.utf-8.add spell

nnoremap <Leader>s ]s
nnoremap <Leader>a zg]s 

#Use smart case by default (ignore case when only lowercase characters)
set smartcase

