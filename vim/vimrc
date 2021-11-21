set nocompatible			"disable old vi bugs



colorscheme slate
"colorscheme delek
"colorscheme elflord

"""UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"""turn off modelines (don't use vim specific commands per file)
set modelines=0

"""basic QOL
syntax enable
"set visualbell				"blink cursor instead of sounding
set history=100
set undolevels=100
set number 					"show line numbers
set scrolloff=3				"scroll before edge of screen
filetype plugin indent on
set autoindent				"automatically indent
set smartindent				"be C aware when auto intenting
set showmatch				"hilight matching brace
set comments=sl:/*,mb:\ *,elx:\ */
set path+=**				"fuzzy file search
set laststatus=2

"""improve status line
set statusline=
set statusline+=%f			"tail of filename
set statusline+=[%n%H%M%R%W]	"Display what buffer, if it is help, if modified, if read only, and if preview
set statusline+=[%{strlen(&fenc)?&fenc:'none'},	"file encoding
set statusline+=%{&ff}]		"file format
set statusline+=%y			"filetype
set statusline+=%=			"left/right separator
set statusline+=[%b]\ 	"value of character under cursor
set statusline+=%c			"cursor column
set statusline+=%l/%L		"cursor line/total lines
set statusline+=\ %P		"percentage through file

"""tab stuff
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent

"""use a mouse
""if has('mouse')
""	set mouse=a
""endif

"""searching
set incsearch
set hlsearch

"""helpfulness
set showcmd					"show cmd as we type
set cursorline				"hilight the current line
set wildmenu				"menu when tab complete
set wildignore=*.swp,*.bak,*.o,.git/*,*.a,*.so,build/*
"set lazyredraw	"don't reraw during macros

"""custom commands
"insert custom banner (i.e. UNCLASSIFIED)
"command Banner :r ~/Banner.txt
"map <F4> :Banner<CR>

"clear search
map <C-l> :noh<CR>

"build project
command CMake !mkdir -p build && cd build && cmake .. && make
map <F5> :CMake<CR>

"clean project
command GitClean !git clean -dfX
map <C-F5> :GitClean<CR>

"save progress
command GitAdd !git add .
map <C-s> :wa<CR>:GitAdd<CR>

"use ctrl+F12 to generate tags for the current project
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS -f ~/.vim/tags/project --extra=+q .<CR>
set tags+=~/.vim/tags/project

"""plugins
set nocp
filetype plugin on

"""""OmniCpp
"set tags+=~/.vim/tags/cpp
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std"]

"""""NERDTree
set rtp+=~/.vim/plugins/nerdtree
"autocmd vimenter * NERDTree		"start NERDTree when vim starts with a file
map <C-a> :NERDTreeToggle<CR>

"start NERDTree when vim starts without a file
autocmd vimenter StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cpp', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('h', 'darkgreen', 'none', 'darkgreen', '#151515')
call NERDTreeHighlightFile('c', 'red', 'none', 'red', '#151515')

call NERDTreeHighlightFile('txt', 'yellow', 'none', 'yellow', '#151515')

let NERDTreeIgnore = ['\CMakeFiles$', '\CMakeCache.txt$', '\~$', '\.a$']

"""""uncrustify
set rtp+=~/.vim/plugins/decrustify
autocmd FileType c noremap <buffer> <c-f> :call Uncrustify('c')<CR>
autocmd FileType c vnoremap <buffer> <c-f> :call RangeUncrustify('c')<CR>
autocmd FileType cpp noremap <buffer> <c-f> :call Uncrustify('cpp')<CR>
autocmd FileType cpp vnoremap <buffer> <c-f> :call RangeUncrustify('cpp')<CR>

