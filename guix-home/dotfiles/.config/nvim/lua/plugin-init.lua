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
  Plug('junegunn/fzf')
  Plug('junegunn/fzf.vim')
  Plug('vim-airline/vim-airline')
  Plug('vim-airline/vim-airline-themes')
  Plug('https://github.com/Mofiqul/dracula.nvim')
  Plug('martinda/Jenkinsfile-vim-syntax')

  -- Git
  Plug('tpope/vim-fugitive')
  Plug('f-person/git-blame.nvim')

  -- general lsp
  Plug('neovim/nvim-lspconfig')
  Plug('williamboman/nvim-lsp-installer')
  -- :LspInstall to install an lsp

  -- c++ stuff
  Plug('https://github.com/derekwyatt/vim-fswitch')
  Plug('https://github.com/vim-scripts/DoxygenToolkit.vim')
  Plug('scrooloose/syntastic')
  Plug('https://github.com/preservim/tagbar')


--C++ lsp
--  Plug 'neovim/nvim-lsp' " nvim-lsp

  Plug('prabirshrestha/vim-lsp')
  --Plug('Shougo/deoplete.nvim', { ['do'] = ':UpdateRemotePlugins' })
  --pip3 install --user pynvim
  --Plug('lighttiger2505/deoplete-vim-lsp')
  Plug('jackguo380/vim-lsp-cxx-highlight')

  -- lisp stuff
  if vim.fn.executable('sbcl') == 1 then
      -- lisp
      Plug('vlime/vlime', { rtp = 'vim/' }) 
      Plug('kovisoft/paredit')
  end

  -- python lsp
  --Plug('deoplete-plugins/deoplete-jedi')

  -- java lsp
  Plug('mfussenegger/nvim-jdtls')

  -- treesitter
  Plug('nvim-treesitter/nvim-treesitter')


  -- Kitty config file coloring
  Plug('fladson/vim-kitty')

  -- Emacs stuff
  -- Org mode
  --Plug("nvim-orgmode/orgmode")

vim.call("plug#end")

