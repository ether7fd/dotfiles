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
            vim.keymap.set("n", "<Leader>ff", "<cmd>FzfLua builtin<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fd", "<cmd>FzfLua diagnostics_document<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fg", "<cmd>FzfLua live_grep<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fc", function()
              -- 現在開いているバッファの絶対パスからディレクトリ部分だけを抽出
              local current_dir = vim.fn.expand("%:p:h")
              current_dir = current_dir:gsub("^oil://", "")
              -- そのディレクトリを検索対象(cwd)として fzf-lua を起動
              require("fzf-lua").live_grep({ cwd = current_dir })
            end, { desc = "Live grep in current file's directory" })
            vim.keymap.set("n", "<Leader>fG", "<cmd>FzfLua grep_cWORD<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fl", "<cmd>FzfLua blines<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fn", "<cmd>FzfLua files<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fN", "<cmd>FzfLua oldfiles<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fb", "<cmd>FzfLua buffers<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>ft", "<cmd>FzfLua tabs<CR>", { noremap = true })
            vim.keymap.set("n", "<Leader>fr", "<cmd>FzfLua resume<CR>", { noremap = true })
        end,
    },
    {
        "stevearc/oil.nvim",
        keys = {
            { "<C-n><C-n>", "<cmd>Oil<CR>", mode = "n" },
        },
        opts = {
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-l>"] = "actions.select",
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-s>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<TAB>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["<C-h>"] = "actions.parent",
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
