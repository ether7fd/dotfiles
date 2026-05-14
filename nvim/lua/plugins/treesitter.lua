return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-treesitter.config").setup({
      -- ここで指定した言語のパーサーが自動的にインストールされる
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

      -- 構文ハイライトを有効化
      highlight = {
        enable = true,
        -- C言語などで、古くて重いVim標準のハイライト機能と競合するのを防ぐ
        additional_vim_regex_highlighting = false,
      },

      -- インデントもTreesitterベースにして正確にする
      indent = { enable = true },
    })
  end,
}
