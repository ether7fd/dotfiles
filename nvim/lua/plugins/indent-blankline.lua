return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("ibl").setup({
			exclude = {
				filetypes = { "dashboard" },
			},
			indent = {
				-- char = "│", -- 画像のような綺麗な縦線にする
				char = "▏", -- 画像のような綺麗な縦線にする
			},
			whitespace = {
				highlight = { "Whitespace" },
			},
			scope = {
				-- スコープの上（始まり）と下（終わり）の横線を非表示にする
				show_start = false,
				show_end = false,
			},
		})
	end,
}
