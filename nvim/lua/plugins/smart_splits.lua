return {
	"mrjones2014/smart-splits.nvim",
	event = "VeryLazy",
	config = function()
		local keymap = vim.keymap.set
		-- 自分のサイズ(増減)ではなく、「矢印の方向」へ境界線を押し引きする
		keymap("n", "<M-H>", require("smart-splits").resize_left, { desc = "Resize border left" })
		keymap("n", "<M-J>", require("smart-splits").resize_down, { desc = "Resize border down" })
		keymap("n", "<M-K>", require("smart-splits").resize_up, { desc = "Resize border up" })
		keymap("n", "<M-L>", require("smart-splits").resize_right, { desc = "Resize border right" })
	end,
}
