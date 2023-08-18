--------------------------------
-- General options -------------
--------------------------------


---- Tab stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

---- Look and feel
vim.cmd[[colorscheme dracula]]
vim.opt.background = "dark"

-- transparent background
vim.cmd[[highlight Normal guibg=none]]
vim.cmd[[highlight NonText guibg=none]]


vim.cmd[[filetype on]]
vim.opt.modelines = 0

vim.opt.hidden = true -- background buffers
vim.opt.number = true -- show line numbers
vim.opt.scrolloff = 3 -- scroll before edge of screen
vim.cmd[[filetype plugin indent on]]
vim.opt.smartindent = true	-- be C aware when auto intenting
vim.opt.showmatch = true		 -- hilight matching brace
vim.opt.comments = "sl:/*,mb:\\ *,elx:\\ */"
vim.cmd[[set path+=**]]				-- fuzzy file search
vim.opt.laststatus = 2 -- 2 is always

---- searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

---- helpfulness
--vim.opt.mouse = ""              -- disable mouse
vim.opt.showcmd	= true		    -- show cmd as we type
vim.opt.cursorline = true		-- hilight the current line
vim.opt.wildmenu = true			-- menu when tab complete
vim.opt.wildignore = "*.swp,*.bak,*.o,.git/*,*.a,*.so,build/*"
vim.opt.relativenumber = true   -- relative line numbers
-- vim.opt.lazyredraw = true	-- don't reraw during macros
vim.g.neoterm_autoscroll = 1    -- always scroll to the end of the command output


---- directory usage
vim.opt.backupdir=HOME .. "/.nvim/backups//"
vim.opt.directory=HOME .. "/.nvim/swapfiles//"


