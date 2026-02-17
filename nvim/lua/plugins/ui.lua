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
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
