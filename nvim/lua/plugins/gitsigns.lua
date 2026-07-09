return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		numhl = true,
		linehl = false,
		word_diff = true,
		current_line_blame = true,
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "[g", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "]g", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true })

			map("n", "<leader>gp", gs.preview_hunk)
			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end)
			map("n", "<leader>gd", gs.toggle_deleted)

			-- 現在の変更箇所の変更・削除を取り消して「元の状態」に復活させる (Reset Hunk)
			map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })

			-- 現在の変更箇所だけを `git add` する (Stage Hunk)
			map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
		end,
	},
}
