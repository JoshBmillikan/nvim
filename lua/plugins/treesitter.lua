return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = function()
            -- The rewritten main branch requires tree-sitter-cli to compile parsers.
            if vim.fn.executable("tree-sitter") == 1 then
                vim.cmd("TSUpdate")
            end
        end,
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
                callback = function(args)
                    -- Neovim ships several common parsers. Missing parsers fall back
                    -- to normal syntax highlighting and can be added with :TSInstall.
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end,
    },
}
