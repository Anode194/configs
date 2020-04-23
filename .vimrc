"---------------------------------------- general settings------------------------------------------------------"
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
set shiftwidth=2
set expandtab
<<<<<<< HEAD

set rnu " relative number

=======
set rnu " relative number
set nu " relative number
>>>>>>> ba573dc5924db33a7299b451ac5e3c1e6b725fe1
set timeoutlen=800
"set split to the right and below
set splitbelow splitright
"sets undo directory and file
set undodir=~/.vimdid
" enables permanent undo even if you exited vim
set undofile
" move by visible line 
nnoremap j gj
nnoremap k gk
let mapleader="\<Space>"

"set leader s to clear the search highlight
nnoremap <leader>s :noh<CR>
"-----------------j-----------------------snippets-------------------------------------------------"
" goals markdown template
nnoremap <leader>gt :-1read $HOME/.config/nvim/.skeleton.md<CR>jA
nnoremap <leader>gh :-1read $HOME/.config/nvim/.skeleton.html<CR>
"
" java markdown template
nnoremap <leader>gj :-1read $HOME/.config/nvim/.skeleton.java<CR>

"quick copy /paste from / to vim
vnoremap <leader>c "+yy
nnoremap <leader>c "+yy
nnoremap <leader>p "*p

"-----------------------------------------status line--------------------------------------------------"
set statusline= ""
set statusline+=%#DiffAdd#
set statusline+=\ %F\  
set statusline+=%#foldColumn#  
set statusline+=\ %Y
set statusline+=\ %r 
set statusline+=%#DiffAdd#
set statusline+=%=
set statusline+=%#foldColumn#\    
set statusline+=%{fugitive#head()}\  
set statusline+=%#DiffAdd#
set statusline+=\ <%p%%>\  
set statusline+=\ C%c\ L%l/%L 
set statusline+=\ %#DiffAdd#
set statusline+=\ BUF:\ %n\   

"-----------------------------------------Plugins--------------------------------------------------"

call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'martin-svk/vim-yaml'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'w0rp/ale'
Plug 'keith/swift.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf.vim'
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/goyo.vim'
call plug#end()

"--------------------------------------plugin settings----------------------------------------------------------"
" ale linting 
let g:ale_linters = {'rust': ['rls'],'swift':['sourcekitlsp']}
" change linenumber color
highlight LineNr term=bold cterm=NONE ctermfg=cyan ctermbg=NONE gui=NONE guifg=cyan guibg=NONE


" Use ALE's function for omnicompletion.
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noselect,noinsert

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

" use fzf for file search
set rtp+=/usr/local/opt/fzf

let g:vim_markdown_folding_disabled = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
"let g:limelight_bop = '^\s'
"let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
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
" AutoCompletion settings
" Pass a dictionary to set multiple options to deoplete for autocomplettion
let g:deoplete#enable_at_startup = 1
<<<<<<< HEAD

let g:airline_theme='base16'
call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'martin-svk/vim-yaml'

Plug 'rust-lang/rust.vim'

Plug 'plasticboy/vim-markdown'

Plug 'w0rp/ale'

Plug 'keith/swift.vim'

Plug 'junegunn/fzf.vim'

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

=======
>>>>>>> ba573dc5924db33a7299b451ac5e3c1e6b725fe1
