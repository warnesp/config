
syntax enable

""Plugin stuff
call plug#begin('$HOME/.local/share/nvim/plugged')
  Plug 'https://github.com/scrooloose/nerdtree'
  Plug 'https://github.com/derekwyatt/vim-fswitch'
  Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'
"  Plug 'https://github.com/vim-scripts/OmniCppComplete'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/syntastic'
  Plug 'junegunn/fzf' 
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'https://github.com/Mofiqul/dracula.nvim'
  Plug 'https://github.com/preservim/tagbar'

  ""C++ lsp
""  Plug 'neovim/nvim-lsp' " nvim-lsp

  Plug 'prabirshrestha/vim-lsp'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "pip3 install --user pynvim
  Plug 'lighttiger2505/deoplete-vim-lsp'
  Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()



"tab stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

"colorscheme slate
colorscheme dracula
set background=dark

"transparent background
highlight Normal guibg=none
highlight NonText guibg=none

""set t_Co=256
""set t_ut=

filetype on

"""turn off modelines (don't use vim specific commands per file)
set modelines=0

set history=100
set undolevels=100
set number 					"show line numbers
set scrolloff=3				"scroll before edge of screen
filetype plugin indent on
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
set statusline+=%{FugitiveStatusline()}


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=			"left/right separator
set statusline+=[%b]\ 	"value of character under cursor
set statusline+=%c			"cursor column
set statusline+=%l/%L		"cursor line/total lines
set statusline+=\ %P		"percentage through file


"""use a mouse
"if has('mouse')
"	set mouse=a
"endif

"""searching
set incsearch
set hlsearch

"""helpfulness
set showcmd					"show cmd as we type
set cursorline				"hilight the current line
set wildmenu				"menu when tab complete
set wildignore=*.swp,*.bak,*.o,.git/*,*.a,*.so,build/*
set relativenumber
:nnoremap j jzz
:nnoremap k kzz
"set lazyredraw	"don't reraw during macros

" Ctrl + F1
map <F25> :set relativenumber!<CR>

"""" C++ stuff
"build project
command CMake term PROD_DIR=$PWD; mkdir -p "$HOME/build/$(basename $PWD)" && cd "$HOME/build/$(basename $PWD)" && cmake $PROD_DIR -DCMAKE_EXPORT_COMPILE_COMMANDS=YES -DCMAKE_INSTALL_PREFIX="$HOME/.local/" && ln -sf $HOME/build/$(basename $PWD)/compile_commands.json $PROD_DIR/compile_commands.json && make -j8
map <F5> :CMake<CR>

"clean project
command CleanBuild !PROD_DIR=$PWD; rm -rf "$HOME/build/$(basename $PWD)/"
"map <C-F5> :Git clean -dfX<CR>:CleanBuild<CR> 
map <F29> :CleanBuild<CR> 

"run tests
command RunTest term PROD_DIR=$PWD; ctest --test-dir "$HOME/build/$(basename $PWD)/"
map <F6> :RunTest<CR>

"use ctrl+F12 to generate tags for the current project
map <F36> :term ctags -R --sort=yes --c++-kinds=+p --fields=+iaS -f ~/.config/tags/project --extra=+q .<CR>
set tags+=~/.config/tags/project


set backupdir=$HOME/.vim/backups//
set directory=$HOME/.vim/swapfiles//

"""""airline status

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#taglist#enabled = 1


"""""NERDTree
"autocmd vimenter * NERDTree		"start NERDTree when vim starts with a file
map <C-p> :NERDTreeToggle<CR>

"start NERDTree when vim starts without a file
"autocmd vimenter StdinReadPre * let s:std_in=1
"autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
""' guibg='. a:guibg .
call NERDTreeHighlightFile('cpp', 'lightgreen', 'none', 'lightgreen', '#151515')
call NERDTreeHighlightFile('h', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('c', 'red', 'none', 'red', '#151515')

call NERDTreeHighlightFile('txt', 'yellow', 'none', 'yellow', '#151515')

""""""Vim switch

map <F4> :FSHere<CR>

augroup mycppfiles
  au!
  au BufEnter *.h let b:fswitchdst  = 'cpp,cxx,c'
  au BufEnter *.cpp let b:fswitchdst  = 'h,hpp,hxx'
augroup END

"""""Syntastic

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '--std=c++11 -i $HOME/rti_connext_dds-6.1.0/include/ndds/hpp/'
let g:syntastic_cpp_cppcheck_args = '--std=c++11 --language=c++'
let g:syntastic_cpp_cppclean_args = '-i $HOME/dev/spl/include -I $HOME/rti_connext_dds-6.1.0/include/ndds/hpp'
let g:syntastic_cpp_gcc_args = '-Wall -Wextra '
let g:syntastic_cpp_checkers = ['cppcheck', 'gcc', 'cpplint' ]
let g:syntastic_cpp_check_header = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


"""""doxygen
let g:DoxygenToolkit_briefTag_pre="\\brief "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_returnTag="\\return "

" Ctrl + F9
map <F33> :Dox<CR>


""""fzf
map <C-f> :GFiles<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

"""" 
"nnoremap <silent> <F8> :TlistToggle<CR>
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 45
"let Tlist_Display_Prototype = 1

"nnoremap <silent> <c-F7> :TlistAddFilesRecursive src *.cpp<CR> :TlistAddFilesRecursive include *.h<CR>
"nnoremap <silent> <F7> :TlistUpdate<CR>


""""Tagbar

map <F8> :Tagbar<CR>

""" C++ LSP

let g:deoplete#enable_at_startup = 1

" setting with vim-lsp
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \   'cache': {'directory': stdpath('cache') . '/ccls' },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'cxx'],
      \ })
endif


