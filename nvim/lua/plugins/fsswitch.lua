--------------
-- FsSwitch --
--------------
--
local fsCppGrp = vim.api.nvim_create_augroup("FsPreferCpp", { clear = true })

-- override switching to prefer c++
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.h" },
    command = "let b:fswitchdst = 'cpp,cxx,c'",
    group = fsCppGrp,
})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.cpp" },
    command = "let b:fswitchdst = 'h,hpp,hxx'",
    group = fsCppGrp,
})
