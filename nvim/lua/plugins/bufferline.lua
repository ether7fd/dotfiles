return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false, -- 絶対に起動時に読み込む

  -- opts をやめて、config関数内で明示的に setup を実行する
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        always_show_bufferline = true, -- ファイルが1つでも必ずタブバーを表示する
        indicator = { style = "icon", icon = "▎" },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      }
    })
  end,

  keys = {
    { "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "前のタブ(バッファ)へ" },
    { "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "次のタブ(バッファ)へ" },
    { "<leader>x", "<cmd>bdelete<cr>", desc = "現在のタブを閉じる" },
    { "<leader>t", "<cmd>enew<cr>", desc = "新しいタブを開く" },
  },
}
