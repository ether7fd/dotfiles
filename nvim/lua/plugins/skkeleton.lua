return {
    -- denops.vim 本体
    {
        "vim-denops/denops.vim",
        lazy = true, -- skkeleton の読み込みに合わせる
    },

    -- skkeleton 本体
    {
        "vim-skk/skkeleton",
        dependencies = { "vim-denops/denops.vim" },
        -- 起動速度を優先し、必要になるまで読み込まない
        event = "VeryLazy",
        config = function()
            -- skkeleton の初期設定
            -- 辞書のパスなどは自分の環境に合わせて書き換えてください
            vim.fn["skkeleton#config"]({
                -- ユーザー辞書の場所
                globalDictionaries = { "~/.skk/SKK-JISYO.L" },
                userDictionary = "~/.skk/USER_JISYO",
                eggLikeNewline = true,
                registerConvertResult = true,
            })

            -- キーマップの設定（例：Ctrl+j で SKK ON）
            vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)", { desc = "skkeleton enable" })
            vim.keymap.set({ "i", "c" }, "<C-g>", "<Plug>(skkeleton-disable)", { desc = "skkeleton disable" })
        end,
    },
}
