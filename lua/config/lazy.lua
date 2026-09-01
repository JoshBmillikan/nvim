local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local output = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        error("Could not install lazy.nvim:\n" .. output)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = { { import = "plugins" } },
    defaults = { lazy = true },
    install = { colorscheme = { "material", "habamax" } },
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
    rocks = { enabled = false },
    ui = { border = "rounded" },
})
