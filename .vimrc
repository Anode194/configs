"---------------------------------------- general settings------------------------------------------------------"
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
set shiftwidth=2
set expandtab
set rnu " relative number
set nu " normal number
set timeoutlen=800
"set split to the right and below
set splitbelow splitright
"sets undo directory and file

set undodir=~/.vimdid
" enables permanent undo even if you exited vim
set undofile
" keeps the some lines below the cursor
set scrolloff=2
" move by visible line 
nnoremap j gj
nnoremap k gk
let mapleader="\<Space>"
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,*.swp
"tab navigation
nnoremap <PageUp> gt
nnoremap <PageDown> gT
" set leader s to clear the search highlight
noremap <leader>s :noh<CR>

syntax on

nnoremap <leader>rf :RustFmt<CR>
nnoremap <leader>gf :Files<CR>
"-----------------------------------------file specific settings-------------------------------------------------"
" sets it so it doesn't cut words in half in markdown
autocmd BufReadPost *.md set lbr
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
" sh
" turns off autofolding
set nofoldenable
"-----------------------------------------snippets-------------------------------------------------"
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

nnoremap <leader>n :set rnu<CR>
nnoremap <leader>nn :set nornu<CR>

"-----------------------------------------status line--------------------------------------------------"
set statusline= ""
set statusline+=%#specialkey#
set statusline+=\ %F\  
set statusline+=%#constant#  
set statusline+=\ %Y
set statusline+=\ %r 
set statusline+=%#specialkey#
set statusline+=%=
set statusline+=%#constant#\    
set statusline+=%{fugitive#head()}\  
set statusline+=%#specialkey#
set statusline+=\ <%p%%>\  
set statusline+=%#Type#\    
set statusline+=\ C%c\ L%l/%L 
set statusline+=\ %#specialkey#
set statusline+=\ BUF:\ %n\   

"-----------------------------------------number line--------------------------------------------------"
highlight LineNr term=bold cterm=bold ctermfg=cyan ctermbg=none gui=NONE guifg=cyan guibg=NONE
highlight cursorLineNr cterm=bold cterm= underline ctermfg = magenta

"-----------------------------------------autocomplete--------------------------------------------------"
" use tabs instead of ctrl-n ctrl-p for autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

highlight Pmenu ctermbg=darkmagenta ctermfg=black
"-----------------------------------------Plugins--------------------------------------------------"

call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  lug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'rust-lang/rust.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'
Plug 'w0rp/ale'
Plug 'ap/vim-css-color'
Plug 'keith/swift.vim'
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

"--------------------------------------helpful functions----------------------------------------------------------"
"open url in browser
nnoremap <leader>w :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>
"--------------------------------------plugin settings----------------------------------------------------------"
" ale linting 
let g:ale_linters = {'rust': ['rls','cargo!!','rustc','rustfmt'],'swift':['sourcekitlsp'],'javascript':['eslint']}
"

" Use ALE's function for omnicompletion.
let g:ale_completion_max_suggestions = 10
set omnifunc=ale#completion#Omnifunc
let g:ale_completion_enabled = 1
let g:deoplete#enable_at_startup = 1

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
"let g:limelight_bop = '^\s'
"let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight 
autocmd! User GoyoLeave Limelight! 

let g:deoplete#enable_at_startup = 1
