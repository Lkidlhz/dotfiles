return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require("plugins.plugins_config.treesitter")
    end,
}
