" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" autocompletion
Plug 'Valloric/YouCompleteMe'

" nerdtree
Plug 'preservim/nerdtree'

" emmett
Plug 'https://github.com/mattn/emmet-vim'

" ack - run your favourite search tool from vim.
Plug 'mileszs/ack.vim'

" creates closing bracket/parenthesis automatically.
Plug 'jiangmiao/auto-pairs'

" highligh yanked words/lines
Plug 'machakann/vim-highlightedyank'

" fuzzy file and tag search
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" redefine default mapping and the default command.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" LaTeX support
Plug 'lervag/vimtex'
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


" syntax highlighting for .Vue component files
Plug 'https://github.com/posva/vim-vue'


" if neosnippet integration is not enabled, insert opening parenthesis when
" completing function name.
let g:autocomplete_flow#insert_paren_after_function = 0
		
" colorschemes
Plug 'https://github.com/xstrex/FireCode.vim'
Plug 'https://github.com/chriskempson/base16-vim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/altercation/vim-colors-solarized'


call plug#end()

 
