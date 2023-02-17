---------------------------
-- Leader key mapping -----
---------------------------

--vim.g.leaderMapperWidth = 40
--vim.g.leaderMapperPos = 'bottom'
local wk = require("which-key")

wk.register({
  p = { ":NvimTreeToggle<CR>", "File Tree" }, -- create a binding with label
  l = {
      name = "Lisp",
      l = {":call vlime#plugin#LoadFile(expand(\"%:p\"))<CR>", "Load File"},
      n = {":bo vs tmp-repl<CR>|:set filetype=lisp<CR>|:setlocal buftype=nofile<CR>|:setlocal bufhidden=hide<CR>|:setlocal noswapfile<CR>", "Temp REPL"}, 
      r = {":call vlime#server#New(v:true, get(g:, \"vlime_cl_use_terminal\", v:false))<CR>" ,"Start Server"},
      R = {":call vlime#plugin#StopCurrentServer()<CR>" ,"Stop Server"},
  },
  n = { ":set number!<CR>", "Line Numbers" },
  N = { ":set relativenumber!<CR>", "Relative Line Numbers" },
  b = { ":GitBlameToggle<CR>", "Toggle git blame" },
  s = {
    name = "Search", -- optional group name
    s = {":BLines<CR>", "Text search in current buffer"},
    f = {":GitFiles<CR>", "File Search" },
    S = {":Lines<CR>", "Text search across all buffers"},
    g = {":BCommits<CR>", "Search git commits of current buffer"},
    G = {":Commits<CR>", "Search git commits of repository"},
    t = {":Tags<CR>", "Search tags"},
  },
  c = {
      name = "C++",
      b = { ":CMake<CR>", "Make project (CMake)" },
      B = { ":CleanBuild<CR>", "Clean Project" },
      d = { ":Dox<CR>", "Add doxygen comment" },
      d = { ":RunTest<CR>", "Run Unit Test" },
      n = { "<c-]>", "Go to definition Ctrl-]" },
      N = { "<c-t>", "Go back to previous tag Ctrl-t" },
      s = { ":FSHere<CR>", "Switch files" },
      t = { ":Tagbar<CR>", "Tagbar" },
      T = { ":CreateCtags<CR>", "Create CTags" },
  },
}, { prefix = "<leader>", nowait = true })



