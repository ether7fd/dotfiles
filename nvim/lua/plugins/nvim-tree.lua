return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
    { "<leader>f", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Focus NvimTree" },
  },
  opts = {
    -- 1. ファイル同期を有効化
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      -- カスタムマップ
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      vim.keymap.set("n", "/", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "-", api.node.open.horizontal, opts("Open: Horizontal Split"))

    end,
    renderer = {
      highlight_git = true, -- Git状態を色付け
      indent_markers = { enable = true },
      icons = {
        show = {
          git = true,
          folder = true,
          file = true,
        },
      },
    },

    -- 画面端で邪魔にならないよう、自動で幅を調整する設定
    view = {
      width = {
        min = 30,
        max = 50,
      },
      side = "left",
    },
  },
}
