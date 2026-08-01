return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        keys = {
            {
                "<leader>e",
                function()
                    require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
                end,
                desc = "Explorer (current file)",
            },
            {
                "<leader>E",
                function()
                    require("nvim-tree.api").tree.toggle({ path = vim.uv.cwd() })
                end,
                desc = "Explorer (working directory)",
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            hijack_cursor = true,
            sync_root_with_cwd = true,
            update_focused_file = { enable = true, update_root = false },
            view = { width = 34, preserve_window_proportions = true },
            renderer = {
                group_empty = true,
                highlight_git = true,
                icons = { git_placement = "after" },
            },
            filters = { custom = { "^.git$" } },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep project" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
            { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },
            { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
        },
        opts = {
            defaults = {
                prompt_prefix = "  ",
                selection_caret = "  ",
                path_display = { "smart" },
                mappings = {
                    i = { ["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous" },
                },
            },
            pickers = { find_files = { hidden = true } },
        },
    },
}
