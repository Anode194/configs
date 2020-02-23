filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4

set shiftwidth=4

set expandtab

set number

set timeoutlen=800

let mapleader="\<Space>"

" custom hotkeys with space as leader

" move by line 
nnoremap j gj
nnoremap k gk

" goals markdown template
nnoremap <leader>gt :-1read $HOME/.config/nvim/.skeleton.md<CR>jA

" enables permanent undo even if you exited vim
set undodir=~/.vimdid
set undofile

" ale linting 
let g:ale_linters = {'rust': ['rls']}
" change linenumber color
highlight LineNr term=bold cterm=NONE ctermfg=cyan ctermbg=NONE gui=NONE guifg=cyan guibg=NONE



" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" type shift + h to hide all status bars for typing test videos.

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set nonumber
        set nowrap
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

let g:airline_theme='base16'
call plug#begin('~/.vim/plugged')
Plug 'martin-svk/vim-yaml'

Plug 'rust-lang/rust.vim'

Plug 'plasticboy/vim-markdown'

Plug 'airblade/vim-rooter'

Plug 'w0rp/ale'

Plug 'junegunn/fzf', {'do': { -> fzf#install() } }

Plug '/usr/local/opt/fzf'

Plug 'altercation/vim-colors-solarized'

Plug 'dylanaraps/wal.vim'

Plug 'tpope/vim-surround'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'plasticboy/vim-markdown'

Plug 'junegunn/goyo.vim'

Plug 'junegunn/limelight.vim'

Plug 'yuttie/comfortable-motion.vim'

Plug 'machakann/vim-highlightedyank'

call plug#end()

