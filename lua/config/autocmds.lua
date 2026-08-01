local group = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    desc = "Highlight copied text",
    callback = function()
        vim.hl.on_yank({ timeout = 150 })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,
    desc = "Return to the last edit position",
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "help", "man", "qf", "checkhealth", "lspinfo" },
    desc = "Close utility windows with q",
    callback = function(args)
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
    end,
})
