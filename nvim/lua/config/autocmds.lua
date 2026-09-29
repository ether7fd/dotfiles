vim.cmd("autocmd!") -- remove all autocmd

local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Restore cursor location when file is opened
autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- Set indent width
-- autocmd("BufEnter", {
-- 	setlocal,
-- 	pattern = "*.rs",
-- 	command = "set shiftwidth=4",
-- })
--
-- autocmd("BufEnter", {
-- 	setlocal,
-- 	pattern = { "*.ts", "*.tsx" },
-- 	command = "set shiftwidth=2",
-- })
--
-- autocmd("BufEnter", {
-- 	setlocal,
-- 	pattern = { "*.json" },
-- 	command = "set shiftwidth=2",
-- })

autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

autocmd("TabEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "terminal" then
			vim.cmd("startinsert")
		end
	end,
})

autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local server_name = client.name

		-- hover は pyright などに任せる
		if server_name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
		vim.notify("LSP server: " .. server_name .. "\nAttached to: " .. vim.fn.expand("%"))
		-- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]) -- auto format on save
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local function map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
		end
		map("gr", "<cmd>FzfLua lsp_references<CR>", "LSP references")
		map("gd", "<cmd>FzfLua lsp_definitions<CR>", "LSP definitions")
		map("gD", vim.lsp.buf.declaration, "LSP declaration")
		map("gi", vim.lsp.buf.implementation, "LSP implementation")
		map("gt", vim.lsp.buf.type_definition, "LSP type definition")
		map("<leader>lr", vim.lsp.buf.rename, "LSP rename")
		map("<leader>la", vim.lsp.buf.code_action, "LSP code action")
		map("<leader>ll", function()
			vim.notify("LSP server: " .. server_name .. "\nAttached to: " .. vim.fn.expand("%"))
		end, "LSP info")
		map("<leader>llf", function()
			vim.lsp.buf.format({ async = true })
			vim.notify("Format by LSP: " .. server_name)
		end, "LSP format")
		-- show diagnostic on hover
		local group = vim.api.nvim_create_augroup("OoO", {})

		local function au(typ, pattern, cmdOrFn)
			if type(cmdOrFn) == "function" then
				vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
			else
				vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
			end
		end

		au({ "CursorHold", "InsertLeave" }, nil, function()
			local opts = {
				focusable = false,
				scope = "cursor",
				close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
			}
			vim.diagnostic.open_float(nil, opts)
		end)

		au("InsertEnter", nil, function()
			vim.diagnostic.enable(false)
		end)

		au("InsertLeave", nil, function()
			vim.diagnostic.enable(true)
		end)
	end,
})

-- カーソルがバッファ/ウィンドウ/分割画面から離れたら絶対行番号に戻す
local numbertoggle = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
autocmd({ "BufLeave", "WinLeave", "FocusLost" }, {
	group = numbertoggle,
	pattern = "*",
	callback = function()
		vim.opt.relativenumber = false
	end,
})
