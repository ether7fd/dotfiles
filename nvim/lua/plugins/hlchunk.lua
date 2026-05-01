return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true, -- Tree-sitterを使用してより正確に判定する
        -- 線のスタイルや色を変更したい場合は以下のコメントアウトを外して調整できます
        -- chars = {
        --   horizontal_line = "─",
        --   vertical_line = "│",
        --   left_top = "╭",
        --   left_bottom = "╰",
        --   right_arrow = ">",
        -- },
        -- style = "#806d9c",
      },
      indent = {
        enable = true,
        use_treesitter = true,
      },
      -- 行番号のハイライト
      line_num = {
        enable = true,
      },
      -- 空白のハイライト
      blank = {
        enable = true,
      },
    })
  end
}
