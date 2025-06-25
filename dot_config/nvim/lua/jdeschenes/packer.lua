-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', branch="master",--tag = '0.1.8',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Color Scheme
  use('rebelot/kanagawa.nvim')

  use('christoomey/vim-tmux-navigator')

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  
  use {
      'neovim/nvim-lspconfig',
      requires = {
          -- LSP Support
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
          -- Autocompletion
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/nvim-cmp',
          'L3MON4D3/LuaSnip',
          'saadparwaiz1/cmp_luasnip',
      }
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('trouble').setup {

        }
    end
  }
end)
