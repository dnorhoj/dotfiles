"
" VimPlug plugins
"
call plug#begin('~/.vim/plugged')

" Color theme
Plug 'altercation/vim-colors-solarized'

" Misc
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/syntastic'
Plug 'sbdchd/vim-run'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
" Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/brainfuck-syntax'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

call plug#end()

"
" Color theme
"
syntax enable
set background=dark
" colorscheme solarized
colorscheme codedark

"
" Deoplete (autocomplete)
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

"
" Airline (bottom bar)
"
let g:airline_theme='codedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"<C-LeftRelease>
" NERDTree
"
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

"
" Syntastic
" 
let g:syntastic_python_checkers = ['pyflakes']

"
" Vimtex
"
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"let g:vimtex_compiler_method = 'latexmk'

"
" Ultisnips
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"
" RUN
"
let g:run_cmd_python = ['python3']
let g:run_cmd_brainfuck = ['beef', '--enable-debugging', run#defaults#fullfilepath()] 

"
" Settings
"
set number " Enable line numbers
set mouse=a " Enable mouse
set splitbelow " Open splits vertically

"
" Per-filetype syntax
"
au BufRead,BufNewFile *.bf set filetype=brainfuck

"
" Keybinds
"

" Run file with F5
noremap <F5> :Run<CR>

" Tab control
noremap <C-t> :tabnew<CR>

"noremap <C-w> :q<CR>
noremap <C-s> :w<CR>

" Selection
noremap <C-a> ggVG 

" Tab change keybinds
noremap <unique> <M-1> 1gt
noremap <unique> <M-2> 2gt
noremap <unique> <M-3> 3gt
noremap <unique> <M-4> 4gt
noremap <unique> <M-5> 5gt
noremap <unique> <M-6> 6gt
noremap <unique> <M-7> 7gt
noremap <unique> <M-8> 8gt
noremap <unique> <M-9> 9gt
noremap <unique> <M-0> 10gt
