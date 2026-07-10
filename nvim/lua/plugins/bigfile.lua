return {
	"LunarVim/bigfile.nvim",
	-- lazy = false の代わりにイベントで読み込む
	event = { "FileReadPre", "BufReadPre", "BufNewFile" },
	config = function()
		require("bigfile").setup({
			filesize = 2,
			pattern = { "*" },
			features = {
				"indent_blankline",
				"lsp",
				"treesitter",
				"syntax",
				"matchparen",
			},
		})
	end,
}
