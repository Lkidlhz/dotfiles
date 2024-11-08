return {
    {
        "numToStr/Comment.nvim",
	    event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
	    event = "VeryLazy",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
             -- your configuration comes here
             -- or leave it empty to use the default settings
             -- refer to the configuration section below
            -- PERF:
            -- HACK:
            -- TODO:
            -- NOTE:
            -- FIX:
            -- WARNING:
        },
	    event = "VeryLazy",
    }
}
