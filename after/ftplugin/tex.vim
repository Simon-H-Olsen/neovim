" make it so that nvim will autodetect files with .tex as latex files
let g:tex_flavor = 'latex'

autocmd FileType tex map <F9> :w<CR> \ll <CR>
autocmd FileType tex inoremap jj \\<CR>

autocmd FileType tex nnoremap k gk
autocmd FileType tex nnoremap j gj
autocmd FileType tex nnoremap <F8> <C-w><C-]><C-w>T


autocmd FileType tex inoremap FR \frac{<++>}{<++>}<++><c-j>
autocmd FileType tex inoremap PAR \left(<++>\right)<++><c-j>
autocmd FileType tex inoremap RM \mathrm{<++>}<++><c-j>
autocmd FileType tex inoremap AL \begin{align} <CR><++><CR>\end{align}<++><UP><UP><c-j>
autocmd FileType tex inoremap POW ^{<++>}<++><c-j>
autocmd FileType tex inoremap UND _{<++>}<++><c-j>
autocmd FileType tex inoremap MAT \[%change p to v to get horizontal lines instead of parantheses <CR>\begin{pmatrix}<CR><++> & <++> \\<CR><++> & <++> <CR>\end{pmatrix}<CR>\]<UP><UP><UP><UP><UP><c-j>

autocmd FileType tex imap SS \subsection{<++>}<CR><++><UP><c-j>
autocmd FileType tex imap SEC \section{<++>}<CR><++><UP><c-j>


