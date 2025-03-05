-- leader key: not sure why all this other gunk is necessary but it didn't work without it.
local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }
map("", "<Space>", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -- basic configs 
-- line number
vim.opt.relativenumber = true
vim.opt.number = true
-- TODO: make a toggle for this with a remap because I think it could be useful some of the time.
vim.opt.cursorline = false
-- mouse
vim.opt.mouse = 'a'
-- show mode turned off because its added to status line
vim.opt.showmode = false;
vim.opt.breakindent = true;
vim.opt.undofile = true
vim.opt.splitright = true
--split positions
vim.opt.splitbelow = true
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.list = true
-- white space characters
vim.optlistchars = {tab = '» ', trail = '·', nbsp = '␣' }
-- preview %s commands
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 10

vim.opt.termguicolors = true


-- plugins

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('machakann/vim-highlightedyank')
--focused writing:
Plug('junegunn/goyo.vim')
Plug('junegunn/limelight.vim')
Plug('ghifarit53/tokyonight-vim')
Plug('tiagovla/tokyodark.nvim')
 --git integration
Plug('tpope/vim-fugitive')
-- better surround keymaps
Plug('tpope/vim-surround')
Plug('ibhagwan/fzf-lua')
Plug('gmist/vim-palette')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
vim.call('plug#end')
-- note: vimplug is in vimscript so you have to wrap do and for in [] for it to not error. those are reserved tokens in lua _i think_. I may switch plugin managers but I've always liked plug for its clean interface.
-- TODO:
-- ale / lsp
-- mason lsp installing
require("treesitter") -- additional treesitter configs
-- remaps
-- netrw
vim.keymap.set('n', '<Leader>fe', vim.cmd.Ex)
-- clear search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- fzf keybinds
vim.keymap.set('n', '<leader>b',':FzfLua buffers<cr>')
vim.keymap.set('n', '<leader>G',':FzfLua git_files<cr>')

vim.keymap.set('n', '<leader>cf',':FzfLua files cwd=~/Code/<cr>')
vim.keymap.set('n', '<leader>cf',':FzfLua files cwd=~/Code/<cr>')
-- visual line moving.
vim.keymap.set('n', 'j','gj')
vim.keymap.set('n', 'k','gk')

-- I can't be bothered to figure out the proper way to use luas autocmd this is fewer lines anyway.
-- TODO: switch autocomd to lua
vim.cmd([[
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
]])
vim.cmd("colorscheme tokyonight")
