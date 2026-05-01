return {
  "kawre/neotab.nvim",
  event = "InsertEnter",
  opts = {
    tabkey = "<Tab>", -- 別のキー（例: "<C-l>"）にしたい場合はここを変更
    act_as_tab = true, -- 括弧の外にいる時は普通のTabとして機能させる
    behavior = "nested", -- "direction" より "nested" の方が直感的に外側へ抜けてくれます
    pairs = {
      { open = "(", close = ")" },
      { open = "[", close = "]" },
      { open = "{", close = "}" },
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = "`", close = "`" },
      { open = "<", close = ">" }, -- htmlやジェネリクス用に便利
    },
    exclude = { -- 特定のファイルタイプでは無効にする場合
      ft = { "dashboard", "alpha", "help" },
    },
    -- スマート・インデント（行頭でのTabは常にインデントとして動作）
    smart_punctuation = {
        enabled = true,
        -- 括弧の直後でTabを押した時に、次のペアまで飛ぶか等の挙動
    }
  },
}
