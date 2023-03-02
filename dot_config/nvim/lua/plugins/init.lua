local cmd = vim.cmd
local fn = vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pac k/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd("packadd packer.nvim")
end


cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Auto compile when there are changes in plugins.lua
cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim' -- this is essential.

  -- lsp
  use("neovim/nvim-lspconfig")
  use({
	"ray-x/lsp_signature.nvim",
	config = function()
  	  require("plugins.configs.lspsignature")
  	end
  })
  use("jose-elias-alvarez/nvim-lsp-ts-utils")

  -- Trouble
  use({
		-- prettier diagnostics, I don't use it a lot but
		-- but maybe I should. No keybindings, just
		-- :Trouble<cmd>
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end
	})

  -- null-ls (code actions, etc.)
  use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.configs.null-ls")
		end
	})
  -- plenary required for null-ls
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

  -- completion
  use({
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugins.configs.cmp")
	end,
	requires = {
		"hrsh7th/cmp-buffer", --
		-- "ray-x/cmp-treesitter", --
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-emoji",
		"onsails/lspkind-nvim",
	},
  })
  use({
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({})
	end
  })

  -- languages
  use("fatih/vim-go")
  use("pangloss/vim-javascript")
  use("leafgarland/typescript-vim")
  use("peitalin/vim-jsx-typescript")
  -- neodev - replaces lua-dev
  use("folke/neodev.nvim")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use({
	"saadparwaiz1/cmp_luasnip",
--	config = require("plugins.configs.snippets"),
  })

  -- other
  use({ "rcarriga/nvim-notify" })

  -- nvim tree
  use("kyazdani42/nvim-web-devicons")
  use({
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("plugins.configs.nvimtree")
	end,
	requires = "kyazdani42/nvim-web-devicons",
  })

  -- nvim treesitter
  use({
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("plugins.configs.treesitter")
	end
  })
  use("nvim-treesitter/playground")
  -- fuzzy finder
  use("junegunn/fzf")
  use({
	"junegunn/fzf.vim",
	config = function()
		require("plugins.configs.fzf")
	end,
	run = function()
		vim.fn["fzf#install()"](0)
	end,
  })

  -- jump to character (visual gamechanger)
  use("easymotion/vim-easymotion")

  -- markdown preview
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}
  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- colorscheme
	use("tjdevries/colorbuddy.vim") -- colorscheme creator, needed for a few of these
	use("rakr/vim-one")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/everforest")
	use("sainnhe/edge")
	use("sainnhe/sonokai")
	use("bluz71/vim-nightfly-guicolors")
	use("glepnir/zephyr-nvim")
	use("Th3Whit3Wolf/onebuddy")
	use("EdenEast/nightfox.nvim")
	use("Th3Whit3Wolf/space-nvim")
	use("navarasu/onedark.nvim")
	use("sam4llis/nvim-tundra")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
end)
