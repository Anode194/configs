set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
"---------------------------------------- general settings------------------------------------------------------"
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=4
set shiftwidth=4
set rnu " relative number
set rnu " relative number
set nu " relative number
set timeoutlen=800
" automatically reloads buffer when detecting a change
" sets tn -> tabnew
ca tn tabnew
set autoread
"set split to the right and below
set splitbelow splitright
"sets undo directory and file
set undodir=~/.config/nvim/undo
" enables permanent undo even if you exited vim
set undofile
" move by visible line 
" keeps the some lines below the cursor
set scrolloff=2
nnoremap j gj
nnoremap k gk

set wildmode=longest,list,full
set wildmenu

"tab navigation
nnoremap <PageUp> gt
nnoremap <PageDown> gT
"set leader s to clear the search highlight
let mapleader="\<Space>"
" clears search highlight
nnoremap <leader>s :noh<CR>
" will ignore files that match these patterns so you don't read in non text
" files into vim
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,*.swp
syntax on
"
" run rust format and Rust playpen
let g:rust_clip_command = 'pbcopy'
nnoremap <leader>rf :RustFmt<CR>
nnoremap <leader>rp :RustPlay<CR>
"quick file search
nnoremap <leader>gf :Files<CR>
nnoremap <leader>cb :Cargo build<CR>
nnoremap <leader>cr :Cargo run<CR>

nnoremap <leader>b :buffers<CR>:buffer<Space>

"-----------------------------------------file specific settings-------------------------------------------------"
" sets it so it doesn't cut words in half in markdown
autocmd BufReadPost *.md set lbr
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
" turns off autofolding
set nofoldenable
"-------------------------------------------snippets-------------------------------------------------"
" goals markdown template
nnoremap <leader>gt :-1read $HOME/.config/nvim/.skeleton.md<CR>
nnoremap <leader>gh :-1read $HOME/.config/nvim/.skeleton.html<CR>
nnoremap <leader>gst :-1read $HOME/.config/nvim/song_todo_snippet.txt<CR>
"
" java markdown template
nnoremap <leader>gj :-1read $HOME/.config/nvim/.skeleton.java<CR>

" quickly turn off/on line modes
nnoremap <leader>n :set rnu<CR>
nnoremap <leader>nn :set nornu<CR>
"-----------------------------------------status line + linenumber --------------------------------------------------"
set statusline= ""
set statusline+=%#Type#
set statusline+=\ %F\  
set statusline+=%#constant#  
set statusline+=\ %Y
set statusline+=\ %r 
set statusline+=%#Type#
set statusline+=%=
set statusline+=%#constant#\    
set statusline+=%#specialkey#
set statusline+=\ <%p%%>\  
set statusline+=%#Type#\    
set statusline+=\ C%c\ L%l/%L 
set statusline+=\ %#Type#
set statusline+=\ BUF:\ %n\   

" change linenumber color
highlight LineNr term=bold cterm=NONE ctermfg=cyan ctermbg=NONE gui=NONE guifg=cyan guibg=NONE
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

Plug 'mattn/webapi-vim'
Plug 'prabirshrestha/async.vim'
Plug 'martin-svk/vim-yaml'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'keith/swift.vim'
Plug 'junegunn/fzf.vim'
Plug 'dylanaraps/wal.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/goyo.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'w0rp/ale'
call plug#end()

"--------------------------------------plugin settings----------------------------------------------------------"
"
"-----------------------limelight settings---------------------------------------"
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

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
"-----------------------fzf---------------------------------------"
" use fzf for file search
set rtp+=/usr/local/opt/fzf

let g:vim_markdown_folding_disabled = 1


" tab autocomplete 
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif
" type shift + h to hide all status bars for typing test videos.
autocmd FileType swift setlocal omnifunc=lsp#complete
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
" typescript lang server setup
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
      \ })
endif
" html lang server setup
if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'html-languageserver',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
    \ 'whitelist': ['html'],
  \ })
endif
