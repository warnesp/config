-----------------------
-- Helpful C++ Stuff --
-----------------------

local isCMakeProject = 'if [ -f "CMakeLists.txt" ] ; then echo "In CMake project."; else echo "Not in CMake project." ; exit 0; fi;'
local isCMakeInstalled = 'if ! command -v cmake &> /dev/null ; then echo "CMake not installed" ; exit 0; fi;'
local checkCMake = isCMakeInstalled .. isCMakeProject

-- build project
local buildFolder = HOME .. '/build/$(basename "$PWD")'
local savePwd = 'PROD_DIR="$PWD";'
local makedir = 'mkdir -p "' .. buildFolder .. '"'
local chdir = 'cd "' .. buildFolder .. '"'
local cdBuildDir = makedir .. ' && ' .. chdir
local linkCompileCommands = 'ln -sf "' .. buildFolder .. '/compile_commands.json" "$PROD_DIR/compile_commands.json"'
local cmakeCmd = 'cmake "$PROD_DIR" -DCMAKE_EXPORT_COMPILE_COMMANDS=YES -DCMAKE_INSTALL_PREFIX="' .. HOME .. '/.local/"'
local makeCmd = 'make -j8'

vim.api.nvim_create_user_command('CMake', 'term ' .. savePwd .. checkCMake .. cdBuildDir .. ' && ' .. cmakeCmd ..' && ' .. linkCompileCommands .. ' && ' .. makeCmd, {})

-- clean project
vim.api.nvim_create_user_command('CleanBuild', '!rm -rf "' .. buildFolder .. '"', {})

-- run tests
vim.api.nvim_create_user_command('RunTest', 'term ' .. checkCMake .. ' ctest --test-dir "' .. buildFolder .. '"', {})


-- CTags
local ctagsInstalled = 'if ! command -v ctags &> /dev/null ; then echo "CTags not installed" ; exit 0; fi;'
local ctagsFolder = HOME .. '/.config/tags/project'
local ctagsCmd = 'ctags -R --sort=yes --c++-kinds=+p --fields=+iaS -f ' .. ctagsFolder .. '/$(basename "$PWD") --extra=+q "$PWD"'
local createCtagsFolder = 'mkdir -p ' .. ctagsFolder .. ';'
vim.api.nvim_create_user_command('CreateCtags', 'term ' .. ctagsInstalled .. createCtagsFolder .. ctagsCmd, {})

