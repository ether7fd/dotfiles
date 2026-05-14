return {
  "Bekaboo/dropbar.nvim",
  dependencies = {
    -- 必須の構文解析エンジン
    "nvim-treesitter/nvim-treesitter",
    -- カッコいいファイルアイコンを表示するため（導入済みであればそのまま動きます）
    "nvim-tree/nvim-web-devicons",
  },

  -- 先ほどと同じく、ファイルを開いた瞬間だけ読み込む！
  event = { "BufReadPre", "BufNewFile" },

  -- dropbarはデフォルトの設定が非常に美しく完成されているため、
  -- 細かい設定を書かなくても空の opts で完璧に動きます
  opts = {},
}
