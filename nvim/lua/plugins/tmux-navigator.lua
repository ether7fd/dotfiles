return {
	"christoomey/vim-tmux-navigator",
	event = "VeryLazy",
	init = function()
		-- デフォルトのキーバインド（Ctrl+h/j/k/l）を無効化する
		vim.g.tmux_navigator_no_mappings = 1
		-- (1 = 現在のファイルのみ保存, 2 = 変更されたすべてのファイルを保存)
		vim.g.tmux_navigator_save_on_switch = 2
		-- tmuxのペインがズーム(全画面化)されている時は移動をブロックする
		vim.g.tmux_navigator_disable_when_zoomed = 1
	end,
	config = function()
		-- 代わりに Alt (Option) キー + h/j/k/l を割り当てる
		local keymap = vim.keymap.set
		local opts = { silent = true }

		keymap({ "n", "t" }, "<A-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
		keymap({ "n", "t" }, "<A-j>", "<cmd>TmuxNavigateDown<cr>", opts)
		keymap({ "n", "t" }, "<A-k>", "<cmd>TmuxNavigateUp<cr>", opts)
		keymap({ "n", "t" }, "<A-l>", "<cmd>TmuxNavigateRight<cr>", opts)
		keymap({ "n", "t" }, "<A-\\>", "<cmd>TmuxNavigatePrevious<cr>", opts)
	end,
}
