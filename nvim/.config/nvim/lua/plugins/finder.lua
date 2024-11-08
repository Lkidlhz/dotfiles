return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = "VeryLazy",
        config = function ()
            require("plugins.plugins_config.telescope_nvim")
        end
    }
}
