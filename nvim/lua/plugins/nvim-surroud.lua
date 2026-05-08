return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- 1. setup の中には keymaps を書かずに空で実行します
		require("nvim-surround").setup({})

		-- 2. プラグインが提供する <Plug> マッピングに対して、手動でキーを割り当てます
		local keymap = vim.keymap.set
		keymap("x", "gs", "<Plug>(nvim-surround-visual)", { remap = true, desc = "Surround (Visual)" })
		keymap("x", "gS", "<Plug>(nvim-surround-visual-line)", { remap = true, desc = "Surround (Visual Line)" })
	end,
}
