return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function ()
            require("plugins.plugins_config.lua_line")
        end
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "VimEnter",
    --     config = function ()
    --         require("plugins.plugins_config.indent_nvim")
    --     end
    -- },
    { 
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {},
        config = function ()
            require("plugins.plugins_config.indent_nvim")
        end
    },
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require("plugins.plugins_config.alpha_nvim")
        end
    }
}
