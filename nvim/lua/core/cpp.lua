-----------------------
-- Helpful C++ Stuff --
-----------------------


-- build project
local makeCmd = 'make -j8'
vim.api.nvim_create_user_command('CMake', 'term PROD_DIR=$PWD; mkdir -p "' .. HOME .. '/build/$(basename $PWD)" && cd "' .. HOME .. '/build/$(basename $PWD)" && cmake $PROD_DIR -DCMAKE_EXPORT_COMPILE_COMMANDS=YES -DCMAKE_INSTALL_PREFIX="' .. HOME .. '/.local/" && ln -sf ' .. HOME .. '/build/$(basename $PWD)/compile_commands.json $PROD_DIR/compile_commands.json && make -j8', {})

-- clean project
vim.api.nvim_create_user_command('CleanBuild', '!PROD_DIR=$PWD; rm -rf "' .. HOME .. '/build/$(basename $PWD)/"', {})

-- run tests
vim.api.nvim_create_user_command('RunTest', 'term PROD_DIR=$PWD; ctest --test-dir "' .. HOME .. '/build/$(basename $PWD)/', {})



