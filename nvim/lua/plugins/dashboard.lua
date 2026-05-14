return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- 画像の見た目（hyperテーマ）を維持しつつ設定
      theme = 'hyper',
      config = {
        -- 修正箇所: project_command ではなく project.action を使用
        project = {
          enable = true,
          -- プロジェクトを開く際の動作を FzfLua の Lua API に変更
          action = function(path)
            require('fzf-lua').files({ cwd = path })
          end,
        },

        -- ダッシュボード上のショートカットキー（p, n など）の動作
        shortcut = {
          { desc = '󰊄 Projects', group = '@variable', key = 'p', action = 'FzfLua oldfiles' }, -- ※補足参照
          { desc = '󰈞 Live Grep', group = '@keyword', key = 'g', action = 'FzfLua live_grep' },
          { desc = '󰈔 New File', group = '@parameter', key = 'n', action = 'enew' },
        },

        -- ヘッダー（ロゴ）
        header = {
          [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
          [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
          [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
          [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
          [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
          [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
