-------------------------
-- syntastic ------------
-------------------------


vim.g.syntastic_cpp_compiler = 'g++'
vim.g.syntastic_cpp_compiler_options = '--std=c++17 -i ' .. HOME .. '/rti_connext_dds-6.1.0/include/ndds/hpp/'
vim.g.syntastic_cpp_cppcheck_args = '--std=c++17 --language=c++'
vim.g.syntastic_cpp_cppclean_args = '-i '.. HOME ..'/dev/spl/include -I ' .. HOME .. '/rti_connext_dds-6.1.0/include/ndds/hpp'
vim.g.syntastic_cpp_gcc_args = '-Wall -Wextra '
vim.g.syntastic_cpp_checkers = {'cppcheck', 'gcc', 'cpplint'}
vim.g.syntastic_cpp_check_header = 0
vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 0
vim.g.syntastic_check_on_wq = 0
vim.g.syntastic_sh_shellcheck_args = '-x '
vim.g.syntastic_java_javac_classpath = 'src'
