return {
    "lervag/vimtex",
    -- event = "VeryLazy",
    lazy = false,
    config = function()
		require('plugins.plugins_config.vim_tex')
    end,
}
