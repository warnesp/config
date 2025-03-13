------------------
-- Lisp Mode    --
------------------

-- TODO add start vlime server stuff
-- alias vlime='sbcl --dynamic-space-size 4Gb --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'
-- TODO add connect server key to space

vim.g.vlime_cl_impl= "my_sbcl"

vim.cmd([[function! VlimeBuildServerCommandFor_my_sbcl(vlime_loader, vlime_eval)
    return [ "sbcl", 
    \ "--dynamic-space-size", "4Gb", 
    \ "--load", "/home/pwarnes/quicklisp/setup.lisp",  
    \ "--load", a:vlime_loader, 
    \ "--eval", a:vlime_eval ]
endfunction]])

--function VlimeBuildServerCommandFor_my_sbcl(vlime_loader, vlime_eval)
--    return { "sbcl", 
--    "--dynamic-space-size", "4Gb", 
--    "--load", "/home/pwarnes/quicklisp/setup.lisp",  
--    "--load", vlime_loader, 
--    "--eval", vlime_eval}
--end
