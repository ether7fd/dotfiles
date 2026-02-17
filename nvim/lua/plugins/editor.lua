return {
    {
        "ibhagwan/fzf-lua",
        event = "VeryLazy",
        config = function()
            require("fzf-lua").setup({
                keymap = {
                    fzf = {
                        ["ctrl-q"] = "select-all+accept",
                    },
                },
            })
            -- fzfのキーマップ設定
            vim.api.nvim_set_keymap("n", "<Leader>ff", ":FzfLua builtin<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fd", ":FzfLua diagnostics_document<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fg", ":FzfLua live_grep<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fG", ":FzfLua grep_cWORD<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fl", ":FzfLua blines<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fn", ":FzfLua files<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fN", ":FzfLua oldfiles<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fb", ":FzfLua buffers<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>ft", ":FzfLua tabs<Return>", { noremap = true })
            vim.api.nvim_set_keymap("n", "<Leader>fr", ":FzfLua resume<Return>", { noremap = true })
        end,
    },
    {
        "stevearc/oil.nvim",
        keys = {
            { "<C-n><C-n>", ":Oil<cr>", mode = "n" },
        },
        opts = {
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-s>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<TAB>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
            },
            columns = { "icon", "permissions", "size", "mtime" },
            view_options = { show_hidden = true },
            delete_to_trash = false,
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
