return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

-- plugins/telescope.lua:
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = "VeryLazy",
        config = function ()
            require("plugins.plugins_config.telescope_nvim")
        end
    }
}
