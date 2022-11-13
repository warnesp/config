------------------
-- File Manager --
------------------

-- xbps-install -S font-firacode
-- may need to download from https://www.nerdfonts.com/font-downloads 
-- unzip, move to .font/firacode/, and run fc-cache -fv


-- g? toggles help

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
    },
})
