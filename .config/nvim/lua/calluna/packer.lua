-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}


    ---------- ESSENTIAL-----------
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = 'nvim-lua/plenary.nvim'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Manage language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-buffer'},
            {'saadparwaiz1/cmp_luasnip'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' -- :TSUpdate sometimes doesnt run on PackerSync, run manually
    }

    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('theprimeagen/harpoon')


    ---------- OTHER ----------
    use('tpope/vim-fugitive')
    use('lervag/vimtex')



    ---------- COLORSCHEMES ----------
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
        'aktersnurra/no-clown-fiesta.nvim',
        as = 'no-clown'
    }
end)
