return {
    -- lsp
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			require("plugins.plugins_config.nvim_lsp")
		end,
	},
    {
        "williamboman/mason.nvim",
		event = "VeryLazy",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents   {
		config = function()
			require("plugins.plugins_config.mason_nvim")
		end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
    },

    -- snip
    {
        "L3MON4D3/LuaSnip",
		event = "VeryLazy",
    },
    {
        "saadparwaiz1/cmp_luasnip",
		event = "VeryLazy",
    },
    {
        "rafamadriz/friendly-snippets",
		event = "VeryLazy",
    },

    -- cmp
    {
        "hrsh7th/cmp-nvim-lsp",
		event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-buffer",
		event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-path",
		event = "VeryLazy",
    },
    {
        "hrsh7th/cmp-cmdline",
		event = "VeryLazy",
    },
  --   {
  --       "hrsh7th/cmp-spell",
		-- event = "VeryLazy",
  --   },
    {
        "hrsh7th/nvim-cmp",
		event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons", lazy = true
        },
		config = function()
			require("plugins.plugins_config.nvim_cmp")
		end,
    },

}
