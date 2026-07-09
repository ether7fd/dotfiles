return {
  "esmuellert/codediff.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      -- ノーマルモード（通常時）で起動するように変更
      "<leader>cd",
      "<cmd>CodeDiff<cr>",
      mode = "n",
      desc = "CodeDiff: Open Git Explorer",
    },
  },
}
