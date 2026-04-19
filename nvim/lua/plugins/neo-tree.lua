return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- アイコンを綺麗に表示するために必要
    "MunifTanjim/nui.nvim",
  },
  keys = {
    -- 好きなキーバインドに変更してください
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neo-treeの開閉" },
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Neo-treeにフォーカス" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Neo-treeだけが残った場合、Neovimを閉じる
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      window = {
        position = "left", -- "right" や "float" も選べます
        width = 30,
        mappings = {
          ["l"] = "open",          -- Open: ファイルを開く、またはディレクトリを展開
          ["h"] = "close_node",    -- Close: ディレクトリを閉じる
          ["-"] = "navigate_up",    -- 親ディレクトリをルートにする
          ["<space>"] = "toggle_node", -- スペースキーでディレクトリを展開/折りたたみ
          ["<cr>"] = "open",           -- Enterでファイルを開く
          ["s"] = "open_split",        -- sで水平分割して開く
          ["v"] = "open_vsplit",       -- vで垂直分割して開く
          ["A"] = {
            "add",
            config = {
              show_path = "none" -- "none", "relative", "absolute"
            }
          },
          ["D"] = "delete",            -- dでファイル/ディレクトリ削除
          ["R"] = "rename",            -- rでリネーム
          ["r"] = "set_root",
        }
      },

      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,   -- 開発中はドットファイル(.gitignoreなど)を見たいので表示
          hide_gitignored = true,  -- .gitignoreで除外されたファイルは隠す
        },
        follow_current_file = {
          enabled = true, -- 今開いているファイルに合わせてNeo-treeのツリーを展開・フォーカスする
          leave_dirs_open = false,
        },
        use_libuv_file_watcher = true, -- Neovim外でファイルが作成・削除されたら自動でツリーを更新する
      },
    })
  end,
}
