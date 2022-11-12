------------------
-- LSP settings --
------------------

vim.g["deoplete#enable_at_startup"] = 1

if vim.fn.executable('ccls') == 1 then
    local regLspServer = function() 
        local parentFolderItems = { '.ccls', 'compile_commands.json', '.git/' } -- items that should be in parent folder
        local bufPath = vim.call('lsp#utils#get_buffer_path')
        local parentDir = vim.call('lsp#utils#find_nearest_parent_file_directory', bufPath, parentFolderItems)
        local extensionWhitelist = { 'c', 'cpp', 'cc', 'cxx' }
        local cacheDir = vim.call('stdpath', 'cache') .. '/ccls'
        local uri = vim.call('lsp#utils#path_to_uri', parentDir)
-- /home/pwarnes/dev/k-alg
        vim.call("lsp#register_server", {
            name = 'ccls',
            cmd = { 'ccls' },
            root_uri = function(server_info) return uri end,
            initialization_options = {
                highlight = { lsRanges = true },
                cache = { directory = cacheDir },
            },
            whitelist = extensionWhitelist
        })
    end

    vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "lsp_setup",
        callback = regLspServer,
        group = fsCppGrp,
    })
end

