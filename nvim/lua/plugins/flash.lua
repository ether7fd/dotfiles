return {
  "folke/flash.nvim",
  event = "VeryLazy",

  opts = {
    modes = {
      char = {
        -- f を打った時のターゲットを「現在の行のみ」に制限する（Vim標準と同じ感覚にする）
        multi_line = false,

        -- f の後に文字を打った時、すぐにラベルを表示してワープできるようにする
        jump_labels = true,
      }
    }
  },

  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
