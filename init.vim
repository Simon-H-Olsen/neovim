syntax on

filetype plugin indent on

let mapleader=" "
let maplocalleader = "\\"


source /home/simon/.config/nvim/plugins.vim


" ------------- Visuals -------------

" displays tabs as '>' and spaces as '-', to help linting.
set list
set encoding=utf8
set tabstop=4
set shiftwidth=4
set number
set autoindent
set cindent
set backspace=indent,eol,start
colorscheme solarized

"use 256 colors for terminal vim
set t_CO=256



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

" I need to add support for various latex
" snippets, so I can backup latex templates with git.
" make it easier to change tabs between applications and between terminal
" windows.
" also it is super awkward to use double quotes.
" in vimtutor they have links you can click enter on to activate.
" use :r <FILENAME> to insert the contents of a file
" similarly :r !cmd places the output of a command in the buffer
" press <F1> for online help
" use {  } to go next/previous paragraph
" optimize vim for search and replace with regexp

" -------------- Terminal Mappings ----------------


tmap <ESC> <C-\><C-n>
tmap <C-i> <ESC>


" ---------------- Abbreviations -------------------
" meant for use in insert, replace (R), and command modes
" abbreviations are more robust than mappings, in that they are only
" triggered if the abbreviation is after a space.

:iabbrev adn and
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
augroup END


augroup MyLaTeXCode 
	" Files with extension .tex are processed as TeX files 
	autocmd!
	autocmd BufReadPre,FileReadPre *.tex set ft=tex
	" autocmd FileType tex :source /home/simon/.config/nvim/latex_setup.vim
	au BufNewFile *noter.tex 0r ~/.config/nvim/templates/note_template.tex
	au BufNewFile *report.tex 0r ~/.config/nvim/templates/report_template.tex

	autocmd FileType tex :iabbrev <buffer> listing \begin{lstlisting}<cr><cr>\end{lstlisting}<up>

augroup END

augroup MyJuliaCode 
	autocmd!
	autocmd BufReadPre,FileReadPre *.jl set ft=julia

	autocmd FileType julia source /home/simon/.config/nvim/julia.vim

augroup END


augroup MyJSCode 
	" Files with extension .js or .vue are processed as JavaScript files 
	autocmd!
	autocmd BufReadPre,FileReadPre *.js set ft=javascript
	autocmd BufReadPre,FileReadPre *.vue set ft=javascript

	" indent html files before reading and writing
	autocmd BufWritePre,BufRead *.html :normal gg=G

	autocmd FileType javascript source /home/simon/.config/nvim/web_development.vim

augroup END



