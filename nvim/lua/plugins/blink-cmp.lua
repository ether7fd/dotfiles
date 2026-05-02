return {
  "saghen/blink.cmp",
  version = "*",

  dependencies = {
    -- スニペット（定型文）のコレクション。入れておくと各言語の補完がリッチになります
    "rafamadriz/friendly-snippets",
  },

  -- プラグインのロードを高速化・安定化させるためのLazy.nvimのオプション
  opts_extend = { "sources.default" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
        preset = 'default',
        -- <C-j> で次、<C-k> で前の候補を選択
        -- 'fallback' を入れることで、補完窓が出ていない時は通常の動作
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        -- <Enter> で確定
        ['<CR>'] = { 'accept', 'fallback' },
    },

    appearance = {
      -- 補完メニューにNerd Fontのアイコンを使用する
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    -- 使用する補完ソース（標準で主要なものが全て内蔵されています）
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- 補完メニューやドキュメントウィンドウの見た目（オプション）
    completion = {
      menu = {
        border = "single", -- 枠線をつける（不要なら削除）
      },
      documentation = {
        auto_show = true, -- 補完候補のドキュメント（関数の説明など）を自動表示
        auto_show_delay_ms = 500,
        window = { border = "single" },
      },
    },

    -- 関数の引数を入力している時にヒントを出してくれる機能
    signature = {
      enabled = true,
      window = { border = "single" },
    },
  },
}
