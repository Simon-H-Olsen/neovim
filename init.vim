" enable filetype detection. now ':set filetype?' returns a filetype.
" enable plugin detection. if the filetype is detected the appropriate plugin
" in the 'after' directory is loaded.
filetype plugin indent on
"

let mapleader=" "
let maplocalleader = "\\"

" enable syntax highlighting
syntax on

" now you do not get an error if you switch away from an unsaved buffer
set hidden

source /home/simon/.config/nvim/plugins.vim


" displays tabs as '>' and spaces as '-', to help linting.
set list
" sets the output encoding displayed in the terminal
set encoding=utf8
" now backspace works beyond the text you insert.
set backspace=indent,eol,start
set background=dark
colorscheme solarized


" ------------- Search -------------

set hlsearch
set incsearch
set ignorecase
" case insensitive search if term is lowercase else case sensitive search
set smartcase
" override smartcase by including \C for case sensitive and \c for case insensitive.
" \C and \c can be included anywhere in the search string.


" ------------- Split Management -------------

" for a new horizontal split, the split is below
set splitbelow
" for a new vertical split, the split is to the right
set splitright

nnoremap J :wincmd j<cr>
nnoremap K :wincmd k<cr>
nnoremap L :wincmd l<cr>
nnoremap H :wincmd h<cr>

nnoremap <leader>p :NERDTreeToggle<cr>
nnoremap <leader>o :wincmd o<cr>


" ------------- Mappings -------------
"  One downside of the *map commands is the danger of recursing.
"  Another is the chance that an installed plugin will override some of the
"  mappings.
"  Therefore you should almost always use nonrecursive mappings.

"This unsets the "last search pattern" register by hitting <ESC>
nnoremap <esc> :let @/ = ""<cr>
inoremap <c-c> <esc>:let @/ = ""<cr>

" make it easy to edit the init.vim file
nnoremap <leader>ev :tabedit $MYVIMRC<cr>:NERDTreeToggle /home/simon/.config/nvim<cr>

nnoremap j gj
nnoremap k gk
inoremap <expr> <m-j> pumvisible() ? "<DOWN>" : "<cr>"
inoremap <expr> <m-k> pumvisible() ? "<UP>" : "k"
inoremap <expr> <m-l> pumvisible() ? "<CR>" : "l"

nnoremap <c-l> $
nnoremap <leader>gh :Ack


" change word to upper case. useful for long constant names.
vnoremap <c-u> viwU

nnoremap <c-s> :wa<CR>
inoremap <c-s> <esc>:wa<CR>

vnoremap ' <esc>`>a'<esc>`<i'<esc>E
vnoremap " <esc>`>a"<esc>`<i"<esc>E
vnoremap ( <esc>`>a)<esc>`<i(<esc>E
vnoremap { <esc>`>a}<esc>`<i{<esc>E

nnoremap <silent> <leader>gd :YcmCompleter GoTo<cr>


" ---------------- Abbreviations -------------------
" abbreviations are more robust than mappings, in that they are only
" triggered if the abbreviation is after a space.

:iabbrev lorem <ESC>:r !cat ~/.config/nvim/templates/Lorem\ Ipsum<CR>A



" ------------- Auto Commands -------------
"  autocommands are a way to tell vim to run certain commands whenever certain
"  events happen.
"  skim :help autocmd-events to see a list of all the events you can bind autocommands to.

" important to use augroups. Otherwise everytime you source the nvim.init file
" all the autocmds will be duplicated, and when they are executed all
" duplicates will be run. So after sourcing nvim.init a few times neovim will
" become more are more laggy.
" using augroup must be followed by autocmd!
augroup autosourcing 
	" automatically source init.vim on save
	autocmd!
	autocmd BufWritePost *.vim source %

	" an example of the FileType event.
	" :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
	" usually this won't be necessary since ftplugin is on. this means
	" that vim searches the after directory after any built in plugins 
	" have been applied.
augroup END

