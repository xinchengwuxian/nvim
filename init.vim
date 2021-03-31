" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
set mouse=a
set number
set cursorline
set wildmenu
set hlsearch
set splitbelow
set syntax=on


call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'skywind3000/vim-terminal-help'
Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'voldikss/vim-floaterm'
Plug 'mileszs/ack.vim'
Plug 'connorholyday/vim-snazzy'
call plug#end()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



" floaterm
nmap <C-F> :let floaterm_width=0.6<cr>:let floaterm_height=0.6<cr>:FloatermNew fzf<cr>
nmap <C-G> :let floaterm_width=0.8<cr>:let floaterm_height=0.8<cr>:FloatermNew lazygit<cr>
nmap <C-K> <Esc>:FloatermKill<cr>

" NERDTree Config
nmap <C-N> <Esc>ma
nmap <C-D> <Esc>md
nmap <C-L> :NERDTreeFind<cr>
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" remove line or block
nmap <C-Down> mz:m+<cr>`z
nmap <C-Up> mz:m-2<cr>`z
vmap <C-Down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-Up> :m'<-2<cr>`>my`<mzgv`yo`z

" normal/insert
nmap <C-P> <Plug>MarkdownPreview

" gitgitter
set updatetime=100

Plug 'brooth/far.vim'
" ack
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'

" ag
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1, <bang>0)

nmap <C-S> :Ag 

colorscheme snazzy
