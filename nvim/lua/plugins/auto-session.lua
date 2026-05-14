return {
  "rmagatti/auto-session",
  lazy = false, -- これまで通り、起動時からセッションを復元するために必須

  -- lazy.nvim の機能を使って、スマートにキーマップを登録
  keys = {
    { "<Leader>fs", "<cmd>AutoSession search<CR>", desc = "Search sessions (fzf-lua)" },
    { "<Leader>ss", "<cmd>AutoSession save<CR>", desc = "Save session manually" },
    { "<Leader>sl", "<cmd>AutoSession restore<CR>", desc = "Restore session manually" },
  },

  opts = {
    bypass_save_filetypes = { "oil", "dashboard", "alpha" },
    log_level = "error",
    suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "/" },

    pre_save_cmds = {
      -- "Neotree close",
      -- "NvimTreeClose",
    },

    -- 引数の数 (argc) が 0 の時だけ自動復元を false にする
    auto_restore_enabled = vim.fn.argc() > 0,

    -- セッション検索（Picker）の設定
    session_lens = {
      -- "fzf" を明示的に指定して fzf-lua を使う（nilでも自動検出しますが、念のため）
      picker = "fzf",

      mappings = {
        -- fzf-lua の検索画面で使える便利なショートカット
        delete_session = { "i", "<C-d>" }, -- セッションを削除する
      },

      picker_opts = {
        -- fzf-lua の画面サイズをお好みで調整できます
        height = 0.40,
        width = 0.50,
      },
    },
    -- post_restore_cmds = {
    --   "Tsenable highlight",
    -- },
    post_restore_cmds = {
      function()
        -- vim.schedule を使うことで、セッション復元が完全に終わった直後に実行する
        vim.schedule(function()
          -- pcall は「もしエラーが起きても無視して進める」ための安全装置です
          pcall(function()
            vim.cmd([[edit!]])
          end)
        end)
      end,
    },
  },
}
