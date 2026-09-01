return {
    {
        "marko-cerovac/material.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.material_style = "deep ocean"
        end,
        opts = {
            styles = { comments = { italic = true } },
            plugins = {
                "gitsigns",
                "nvim-cmp",
                "nvim-tree",
                "nvim-web-devicons",
                "telescope",
                "which-key",
            },
        },
        config = function(_, opts)
            require("material").setup(opts)
            vim.cmd.colorscheme("material")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "material-nvim",
                globalstatus = true,
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer keymaps",
            },
        },
        opts = { preset = "modern" },
    },
}
