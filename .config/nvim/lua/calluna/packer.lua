-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  use {
	  'nvim-telescope/telescope.nvim', branch = '0.1.x',
	  requires = 'nvim-lua/plenary.nvim'
  }

  -- colorschemes
  use {
      'axvr/photon.vim',
      as = 'photon'
  }
  use {
      'mcchrish/zenbones.nvim',
      as = 'zenbones',
      requires = 'rktjmp/lush.nvim'
  }
  use {
      'nyoom-engineering/oxocarbon.nvim',
      as = 'oxocarbon'
  }
  use {
      'bluz71/vim-moonfly-colors',
      as = 'moonfly'
  }

  -- other
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate' -- :TSUpdate sometimes doesnt run on PackerSync, run manually
  }
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('lervag/vimtex')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}

end)
