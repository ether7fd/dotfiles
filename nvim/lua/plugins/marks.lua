return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		-- デフォルトで表示するマークの種類
		default_mappings = true,
		-- マークをサインカラムに表示する
		signs = true,
		-- 組み込みマーク (A-Z, a-z) を表示する
		builtin_marks = { ".", "<", ">", "^" },
		-- マークが付けられたときのアニメーションやリフレッシュの間隔
		refresh_interval = 250,
		-- サインカラムに表示されるマークの優先度
		sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
		-- ブックマーク機能（m0-m9など）の設定
		bookmark_0 = {
			sign = "⚑",
			virt_text = "TODO:",
			annotate = false,
		},
		mappings = {
			-- キーマップをカスタマイズしたい場合はここに記述します
			-- 例: set_next = "m,",
		},
	},
}
