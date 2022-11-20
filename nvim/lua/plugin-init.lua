------------------------------
-- Setup plugins -------------
------------------------------

local Plug = vim.fn['plug#']

vim.call("plug#begin", HOME .. '/.local/share/nvim/plugged')
  -- file tree
  Plug('nvim-tree/nvim-web-devicons')
  Plug('kyazdani42/nvim-tree.lua')

  -- get a cool menu from using the leader key
  Plug('folke/which-key.nvim')

  -- QoL
  Plug('tpope/vim-fugitive')
  Plug('junegunn/fzf')
  Plug('junegunn/fzf.vim')
  Plug('vim-airline/vim-airline')
  Plug('vim-airline/vim-airline-themes')
  Plug('https://github.com/Mofiqul/dracula.nvim')

  -- c++ stuff
  Plug('https://github.com/derekwyatt/vim-fswitch')
  Plug('https://github.com/vim-scripts/DoxygenToolkit.vim')
  Plug('scrooloose/syntastic')
  Plug('https://github.com/preservim/tagbar')

--C++ lsp
--  Plug 'neovim/nvim-lsp' " nvim-lsp

  Plug('prabirshrestha/vim-lsp')
  Plug('Shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })
  --pip3 install --user pynvim
  Plug('lighttiger2505/deoplete-vim-lsp')
  Plug('jackguo380/vim-lsp-cxx-highlight')

  -- lisp stuff
  if vim.fn.executable('sbcl') == 1 then
      -- lisp
      Plug('vlime/vlime', { rtp = 'vim/' }) 
      Plug('kovisoft/paredit')
  end
vim.call("plug#end")

