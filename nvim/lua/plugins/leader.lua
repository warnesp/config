---------------------------
-- Leader key mapping -----
---------------------------

--vim.g.leaderMapperWidth = 40
--vim.g.leaderMapperPos = 'bottom'
local wk = require("which-key")
wk.add({
    {"<leader>p", ":NvimTreeToggle<CR>", desc = "File Tree"},
    {"<leader>n", ":set number!<CR>", desc = "Line Numbers"},
    {"<leader>N", ":set relativenumber!<CR>", desc = "Relative Line Numbers"},
    {"<leader>b", ":GitBlameToggle<CR>", desc = "Toggle git blame"},
    {"<leader>c", group = "C++"},
    {"<leader>cb", ":CMake<CR>", desc = "Make project (CMake)"},
    {"<leader>cB", ":CleanBuild<CR>", desc = "Clean Project"},
    {"<leader>cd", ":Dox<CR>", desc = "Add doxygen comment"},
    {"<leader>cD", ":RunTest<CR>", desc = "Run Unit Test"},
    {"<leader>cn", "<c-]>", desc = "Go to definition Ctrl+]"},
    {"<leader>cN", "<c-t>", desc = "Go back to previous tag Ctrl-t"},
    {"<leader>cs", ":FSHere<CR>", desc = "Switch files"},
    {"<leader>ct", ":Tagbar<CR>", desc = "Tagbar"},
    {"<leader>cT", ":CreateCtags<CR>", desc = "Create CTags"},

    {"<leader>l", group = "Lisp"},
    {"<leader>ll", ":call vlime#plugin#LoadFile(expand(\"%:p\"))<CR>", desc = "Load File"},
    {"<leader>ln", ":bo vs tmp-repl<CR>|:set filetype=lisp<CR>|:setlocal buftype=nofile<CR>|:setlocal bufhidden=hide<CR>|:setlocal noswapfile<CR>", desc = "Temp REPL"}, 
    {"<leader>lr" ,":call vlime#server#New(v:true, get(g:, \"vlime_cl_use_terminal\", v:false))<CR>" , desc = "Start Server"},
    {"<leader>lR", ":call vlime#plugin#StopCurrentServer()<CR>" , desc = "Stop Server"},
    {"<leader>s", group = "Search"},
    {"<leader>ss", ":BLines<CR>", desc = "Text search in current buffer"},
    {"<leader>sf", ":GitFiles<CR>", desc = "File Search"},
    {"<leader>sS", ":Lines<CR>", desc = "Text search across all buffers"},
    {"<leader>sg", ":BCommits<CR>", desc = "Search git commits of current buffer"},
    {"<leader>sG", ":Commits<CR>", desc = "Search git commits of repository"},
    {"<leader>st", ":Tags<CR>", desc = "Search tags"},
})



