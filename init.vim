source /home/simon/.config/nvim/plugins.vim

filetype plugin indent on
syntax on
let mapleader=" "
let maplocalleader = "\\"

" displays tabs as '>' and spaces as '-', to help linting.
:set list

:au BufNewFile test.py 0r ~/.config/nvim/templates/python.py
:au BufNewFile *noter.tex 0r ~/.config/nvim/templates/note_template.tex
:au BufNewFile *report.tex 0r ~/.config/nvim/templates/report_template.tex


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
	" indent html files before reading and writing
	autocmd BufWritePre,BufRead *.html :normal gg=G

	" js snippet
	autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
	autocmd FileType tex :iabbrev <buffer> REP <ESC>:r !cat ~/.config/nvim/templates/report_template.tex <CR>
	autocmd FileType tex :iabbrev <buffer> NOTE <ESC>:r !cat ~/.config/nvim/templates/note_template.tex <CR>   
	autocmd FileType tex :iabbrev <buffer> PRES <ESC>:r !cat ~/.config/nvim/templates/presentation.tex <CR>

	autocmd FileType latex :iabbrev <buffer> listing \begin{lstlisting}<cr><cr>\end{lstlisting}<up>
	autocmd FileType tex :iabbrev <buffer> listing \begin{lstlisting}<cr><cr>\end{lstlisting}<up>
	autocmd FileType rs :source /home/simon/.config/nvim/rust.vim
	autocmd FileType javascript source /home/simon/.config/nvim/web_development.vim

	" an example of the FileType event.
	" :autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END

" autocmd FileType tex :source /home/simon/.config/nvim/latex_setup.vim

augroup MyRustCode 
	" Files with extension .tex are processed as TeX files 
	autocmd!
	autocmd BufReadPre,FileReadPre *.rs set ft=rust
augroup END

" this way if you create a file using 'nvim myfile.tex', the 
" correct ':set_filetype?' will be set.
let g:tex_flavor = "tex"

augroup MyLaTeXCode 
	" Files with extension .tex are processed as TeX files 
	autocmd!
	autocmd BufReadPre,FileReadPre *.tex set ft=tex
augroup END

augroup MyJSCode 
	" Files with extension .js or .vue are processed as JavaScript files 
	autocmd!
	autocmd BufReadPre,FileReadPre *.js set ft=javascript
	autocmd BufReadPre,FileReadPre *.vue set ft=javascript
augroup END



" ------------- Visuals -------------

set encoding=utf8
set tabstop=4
set shiftwidth=4
set number
set autoindent
set cindent
set backspace=indent,eol,start
colorscheme solarized
"time is milliseconds till yanked lines stop being highlighted
let g:highlightedyank_highlight_duration = 5000  

set t_CO=256 								"use 256 colors for terminal vim



" ------------- Search -------------

set hlsearch
set incsearch
set ignorecase
" case insensitive search if term is lowercase else case sensitive search
set smartcase
" override smartcase by including \C for case sensitive and \c for case insensitive.
" \C and \c can be included anywhere in the search string.



" ------------- Split Management -------------

set splitbelow 				" ensures that when you create a new horizontal split, the split is below
set splitright				" ensures that when you create a new vertical split, the split is to the right

nnoremap <c-j> :wincmd j<cr>
nnoremap <c-k> :wincmd k<cr>
nnoremap <c-l> :wincmd l<cr>
nnoremap <c-h> :wincmd h<cr>

nnoremap <leader>p :NERDTreeToggle<cr>


" ------------- Mappings -------------
"  One downside of the *map commands is the danger of recursing.
"  Another is the chance that an installed plugin will override some of the
"  mappings.
"  Therefore you should almost always use nonrecursive mappings.

"This unsets the "last search pattern" register by hitting <ESC>
nnoremap <ESC> :let @/ = ""<CR>

" make it easy to edit the init.vim file
nnoremap <leader>ev :tabedit $MYVIMRC<CR>:NERDTreeToggle /home/simon/.config/nvim<cr>

" nnoremap <c-n> ^/<++><CR>v//e<CR>c
" inoremap <c-m> <ESC>^/<++><CR>v//e<CR>c

nnoremap j gj
nnoremap k gk
nnoremap J 3j
nnoremap K 3k
inoremap <expr> <c-j> pumvisible() ? "<DOWN>" : "<cr>"
inoremap <expr> <c-k> pumvisible() ? "<UP>" : "k"
inoremap <expr> <c-l> pumvisible() ? "<CR>" : "l"
imap <m-j> <esc>

nnoremap <m-j> ]]
nnoremap <m-k> [[
nnoremap <m-h> %
nnoremap <m-l> $
nnoremap <leader>k ddkP
nnoremap <leader>j ddp
nmap <leader><leader> V
nnoremap <leader>y "+P
nnoremap <leader>gh :Ack 


" change word to upper case. useful for long constant names.
nnoremap <m-u> viwU

nnoremap <C-s> :wa<CR>
inoremap <C-s> <esc>:wa<CR>

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
" : is also too awkward to use.
" the core philosophy of my vim workflow should be to use touch typing
" and be as fluent as possible, so there is no thinking and no mental blocks
" or something that makes you tired to think of.
" in vimtutor they have links you can click enter on to activate.
" use :r <FILENAME> to insert the contents of a file
" similarly :r !cmd places the output of a command in the buffer
" press <F1> for online help
" use {  } to go next/previous paragraph
" you can also use space key for mapping
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


