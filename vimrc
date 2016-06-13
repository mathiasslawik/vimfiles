execute pathogen#infect()

call pathogen#helptags()

" Exit vim if last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

syntax on
filetype on
au BufNewFile,BufRead *.yml set filetype=ansible

