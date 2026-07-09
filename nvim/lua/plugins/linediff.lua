return {
  "AndrewRadev/linediff.vim",
  keys = {
    {
      -- 1つ目を選択して <leader>ld、2つ目を選択して <leader>ld で比較開始
      "<leader>ld",
      ":Linediff<CR>",
      mode = "v",
      desc = "Linediff: Compare selected text",
    },
    {
      -- 比較を終了してメモリをリセットする
      "<leader>lD",
      "<cmd>LinediffReset<CR>",
      mode = "n",
      desc = "Linediff: Reset",
    },
  },
}
