return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- ここに依存関係を羅列（読み込み順を制御）
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    { "Jint-lzxy/lsp_signature.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    -- 安全のために順番にロード
    local mason = require("mason")
    local mlsp = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local blink = require("blink.cmp")

    -- 1. Mason本体の初期化
    mason.setup({})

    -- 2. Mason-LSPconfig の初期化
    mlsp.setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "lua_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "ts_ls",
        "yamlls",
      },
    })

    -- 3. blink.cmp から能力を取得
    local capabilities = blink.get_lsp_capabilities()

    -- 4. サーバーの自動セットアップ
    -- ここで nil エラーが出るのを防ぐため、mlsp自体に存在するかチェックを入れます
    if mlsp.setup_handlers then
      mlsp.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    else
      vim.notify("mason-lspconfig.setup_handlers が見つかりません", vim.log.levels.ERROR)
    end
  end,
}
