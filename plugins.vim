" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')


" julia support
Plug 'https://github.com/JuliaEditorSupport/julia-vim'

" enables automatic substitution for Julia. now you don't have to use tab-key.
let g:latex_to_unicode_keymap = 1


" repl support
" Plug 'https://github.com/jpalardy/vim-slime'
" let g:slime_target = "tmux"

" nerdtree
Plug 'preservim/nerdtree'

" (un)comment lines with 'gcc' or if selected simply 'gc'
Plug 'https://github.com/tpope/vim-commentary'

" creates closing bracket/parenthesis automatically.
Plug 'jiangmiao/auto-pairs'

" highligh yanked words/lines
Plug 'machakann/vim-highlightedyank'

" time in milliseconds till yanked lines stop being highlighted
let g:highlightedyank_highlight_duration = 5000



Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Track the engine.
"Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-q>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" LaTeX support
Plug 'lervag/vimtex'
let g:tex_flavor = "tex"
"
" this way if you create a file using 'nvim myfile.tex', the 
" correct ':set_filetype?' will be set.
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}



" if neosnippet integration is not enabled, insert opening parenthesis when
" completing function name.
let g:autocomplete_flow#insert_paren_after_function = 0


" colorschemes
Plug 'https://github.com/xstrex/FireCode.vim'
Plug 'https://github.com/chriskempson/base16-vim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/altercation/vim-colors-solarized'


call plug#end()


