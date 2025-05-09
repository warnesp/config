---------------------------
-- NeoVim config file ------
----------------------------
-- global for home
HOME = os.getenv("HOME")

-- convience functions for mapping
local utils = require('core/utils')
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap

-- setup leaders
vim.o.timeoutlen = 400
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- key mappings
F1 = "<F1>"         -- toggle relative line numbers
CtrlF1 = "<F25>"    -- toggle relative line numbers

F4 = "<F4>"         -- FSwitch
F5 = "<F5>"         -- Build
CtrlF5 = "<F29>"    -- Clean build dir
F6 = "<F6>"         -- Run test
F8 = "<F8>"         -- Tagbar
CtrlF9 = "<F33>"    -- Doxygen comment insert
CtrlF12 = "<F36>"   -- Generate C-Tags

CtrlF = "<C-f>"     -- fzf search
CtrlP = "<C-p>"     -- File Tree

nmap("j", "jzz")                -- center screen when moving down
nmap("k", "kzz")                -- center screen when moving up

-- point to python
--vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.python3_host_prog = "/home/pwarnes/python3-virtual/bin/python3"


-- setup plugins
require('plugin-init')

---- Lead key menu
require('plugins/leader')

-- Git
require('plugins/gitblame')

-- setup common stuff
require('core/options')
require('core/autocmds')

nmap(F1, "<CMD>set relativenumber!<CR>")
nmap(CtrlF1, "<CMD>set relativenumber!<CR>")
imap(F1, "<CMD>set relativenumber!<CR>")
imap(CtrlF1, "<CMD>set relativenumber!<CR>")

----  C++ stuff
--require('core/cpp')

--nmap(F5, "<CMD>CMake<CR>")
--nmap(CtrlF5, "<CMD>CleanBuild<CR>") 
--nmap(F6, '<CMD>RunTest<CR>')
--nmap(CtrlF12, '<CMD>CreateCtags<CR>')

---- airline status
require('plugins/airline')

---- NvimTree
require('plugins/nvim-tree')
nmap(CtrlP, "<CMD>NvimTreeToggle<CR>")

---- Vim switch
require('plugins/fsswitch')
nmap(F4, "<CMD>FSHere<CR>")

---- Syntastic
require('plugins/syntastic')

---- Doxygen
require('plugins/doxygen')
nmap(CtrlF9, "<CMD>Dox<CR>")
imap(CtrlF9, "<CMD>Dox<CR>")

---- fzf
local isFzf = vim.fn.executable('fzf')
if isFzf == 1 then
  require('plugins/fzf')
  nmap(CtrlF, "<CMD>GFiles<CR>")
end

---- Tagbar
nmap(F8, "<CMD>Tagbar<CR>")

---- C++ LSP
--require('plugins/lsp')

----- Java Lsp
local isJava = vim.fn.executable('java')
if isJava == 1 then
    require('plugins/java')
end

-- Lisp
require('plugins/vlime')

-- Org Mode
--require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  --ensure_installed = {'org'}, -- Or run :TSUpdate org
}

--require('orgmode').setup({
--  org_agenda_files = {'~/Nextcloud/Documents/org/*' },
--  org_default_notes_file = '~/Nextcloud/Documents/org/refile.org',
--})

