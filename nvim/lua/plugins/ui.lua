return {
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000, -- テーマは最優先でロード
        config = function()
            require("github-theme").setup({
                options = { transparent = true },
            })
            vim.cmd("colorscheme github_dark")

            local set_hl = vim.api.nvim_set_hl

            set_hl(0, "DiffAdd", { bg = "#1E3A29", fg = "NONE" })
            set_hl(0, "DiffDelete", { bg = "#4A2027", fg = "NONE" })
            set_hl(0, "DiffChange", { bg = "#1A2536", fg = "NONE" })
            set_hl(0, "DiffText", { bg = "#2C4A7A", fg = "NONE", bold = true })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
