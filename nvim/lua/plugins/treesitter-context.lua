return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("treesitter-context").setup({
      enable = true,

      -- 画面上部にピン留めする最大行数
      max_lines = 3,

      -- スクロールした時に、どこを基準にピン留めするか
      mode = "cursor",  -- カーソルの位置を基準にする

      -- ピン留めされた行と、実際のコードの間に細い線を引く（境界線）
      separator = "-",
    })
  end,
}
