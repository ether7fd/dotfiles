return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	config = function()
		local neoscroll = require("neoscroll")

		neoscroll.setup({
			hide_cursor = true,
			stop_eof = true,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			easing_function = "sine",
			mappings = {},
		})

		-- キーマップのカスタマイズ（数値を小さくしてスクロールを高速化）
		local keymap = {
			-- <C-u> / <C-d> (半画面スクロール): 250ms -> 100ms
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 100 })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 100 })
			end,

			-- <C-b> / <C-f> (全画面スクロール): 450ms -> 200ms
			-- ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 200 }) end,
			-- ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 200 }) end,

			-- <C-y> / <C-e> (少しだけスクロール): 100ms -> 50ms
			-- ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 50 }) end,
			-- ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 50 }) end,

			-- zt / zz / zb (カーソル位置を合わせる): 250ms -> 100ms
			["zt"] = function()
				neoscroll.zt({ half_win_duration = 100 })
			end,
			["zz"] = function()
				neoscroll.zz({ half_win_duration = 100 })
			end,
			["zb"] = function()
				neoscroll.zb({ half_win_duration = 100 })
			end,
		}

		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
