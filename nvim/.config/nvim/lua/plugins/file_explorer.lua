return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons", lazy = true
	},
	config = function()
		require('plugins.plugins_config.nvim_tree')
		-- require("nvim-tree").setup {}
	end,
}
