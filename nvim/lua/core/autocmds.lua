-------------------------
-- Common autocommands --
-------------------------

vim.api.nvim_create_autocmd( { "BufWritePre" }, {
    pattern = { "*.h", "*.hpp", "*.hxx", "*.cpp", "*.cxx", "*.c" },
    command = ":%s/\\s\\+$//e",
})
