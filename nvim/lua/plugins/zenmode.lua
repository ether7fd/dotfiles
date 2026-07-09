return {
  "folke/zen-mode.nvim",
  -- ZenModeコマンドを実行した時、またはショートカットキーを押した時に遅延読み込みします
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
  opts = {
    window = {
      backdrop = 0.95, -- 背景の暗さ (0から1の間。1は通常と同じ)
      width = 120,      -- Zenウィンドウの幅 (数値、または 0.8 のような割合)
      height = 1,      -- Zenウィンドウの高さ (数値、または割合)
      options = {
        signcolumn = "no",      -- サインカラムを非表示
        number = false,         -- 行番号を非表示
        relativenumber = false, -- 相対行番号を非表示
        cursorline = false,     -- カーソル行のハイライトを無効化
        cursorcolumn = false,   -- カーソル列のハイライトを無効化
        foldcolumn = "0",       -- 折りたたみカラムを非表示
        list = false,           -- 空白文字などを非表示
      },
    },
    plugins = {
      -- Neovimのオプション設定
      options = {
        enabled = true,
        ruler = false,   -- コマンドライン領域のルーラーを非表示
        showcmd = false, -- 画面最下部のコマンド表示を非表示
      },
      twilight = { enabled = true },  -- folke/twilight.nvim との連携 (インストールされている場合)
      gitsigns = { enabled = false }, -- Gitsigns を非表示
      tmux = { enabled = false },     -- tmuxのステータスラインを非表示にする場合は true
    },
    -- コールバック関数 (必要な場合に使用)
    on_open = function(win)
      -- Zen Mode が開いたときに実行したい処理をここに書く
    end,
    on_close = function()
      -- Zen Mode が閉じたときに実行したい処理をここに書く
    end,
  },
}
