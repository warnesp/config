
-- global for home
HOME = os.getenv("HOME")

-- key mappings
F1 = "<F1>"         -- turn off help
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

-- convience functions for mapping
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

---- Turn off F1 Help
nmap(F1, '')
imap(F1, '')

-- setup plugins
require('plugin-init')

-- setup common stuff
require('core/options')
require('core/autocmds')

nmap(CtrlF1, "<CMD>set relativenumber!<CR>")

----  C++ stuff
require('core/cpp')

nmap(F5, "<CMD>CMake<CR>")
nmap(CtrlF5, "<CMD>CleanBuild<CR>") 
nmap(F6, '<CMD>RunTest<CR>')

local ctagsFolder = HOME .. '/.config/tags/project'
local ctagsCmd = 'ctags -R --sort=yes --c++-kinds=+p --fields=+iaS -f ' .. ctagsFolder .. '/$(basename $PWD) --extras=+q $PWD<CR>'
nmap(CtrlF12, ':term mkdir -p ' .. ctagsFolder .. '; ' .. ctagsCmd)

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

---- fzf
require('plugins/fzf')
nmap(CtrlF, ":GFiles<CR>")

---- Tagbar
nmap(F8, ":Tagbar<CR>")

---- C++ LSP
require('plugins/lsp')
