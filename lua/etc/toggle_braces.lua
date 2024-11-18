local notify = vim.notify

local langs = { "typescript", "javascript", "typescriptreact", "javascriptreact", "c", "cpp" }
local function get_text(ft, query)
	local bufnr = vim.api.nvim_get_current_buf()
	local R = {}
	local root = TS.get_root(ft, bufnr)

	local parsed = vim.treesitter.parse_query(ft, query)
	local cursor_row, cursor_col = unpack(vim.api.nvim_win_get_cursor(0))

	R.cursor = { cursor_row, cursor_col }

	for id, node in parsed:iter_captures(root, bufnr, 0, -1) do
		local name = parsed.captures[id]
		if name == "expr" then
			R.range = { node:range() }
			local start_row, start_col, end_row, end_col = unpack(R.range)
			start_row = start_row + 1
			end_row = end_row + 1

			-- notify("cursor_row >= start_row "..cursor_row .. " >= " ..start_row..   " " .. tostring(cursor_row >= start_row))
			-- notify("cursor_row <= end_row   "..cursor_row .. " <= " ..end_row  ..   " " .. tostring(cursor_row <= end_row))
			-- notify("cursor_col >= start_col "..cursor_col .. " >= " ..start_col..   " " .. tostring(cursor_col >= start_col))
			-- notify("cursor_col <= end_col   "..cursor_col .. " <= " ..end_col  ..   " " .. tostring(cursor_col <= end_col))

			if
				(
					cursor_row >= start_row
					and cursor_row <= end_row
					and cursor_col >= start_col
					and cursor_col <= end_col
				) or (start_row ~= end_row and cursor_row > start_row and cursor_row < end_row)
			then
				R.expr_text = vim.treesitter.get_node_text(node:child(0), bufnr)
			end
		end
	end

	if R.range ~= nil and R.expr_text ~= nil then
		notify(vim.inspect(R))
		return R
	else
		notify("Failed to fullfill {range,expr_text}  = " .. vim.inspect({ R }), "warn", { title = IDE.name })
		return nil
	end
end

local function toggle_braces()
	local bufnr = vim.api.nvim_get_current_buf()
	local ft = vim.bo[bufnr].filetype

	local text = nil
	if ft == "cpp" or ft == "c" or ft == "csharp" then
		text = get_text(
			ft,
			[[
(expression_statement) @expr
(compound_statement (expression_statement) @impostor) @brace ]]
		)
		if text == nil then
			return
		end

		if ft == "cpp" then
			vim.api.nvim_buf_set_text(bufnr, text.range[1], text.range[2], text.range[3], text.range[4], {
				"{",
				"\t" .. text.expr_text .. ";",
				"}",
			})
		end
	elseif
		ft == "typescript"
		or ft == "javascript"
		or ft == "typescriptreact"
		or ft == "javascriptreact"
		or ft == "java"
	then
		text = get_text(
			ft,
			[[ (braces_expression condition: (_) @condition consequence: (_) @consequence alternative: (_) @alternative) @braces ]]
		)
		if text == nil then
			return
		end
	else
		notify("Can only be used in " .. vim.inspect(langs), "warn", { title = IDE.name })
		return
	end

	vim.api.nvim_buf_set_text(bufnr, text.range[1], text.range[2], text.range[3], text.range[4], {
		"{",
		"\t" .. text.expr_text .. ";",
		"}",
	})

	notify("Toggled braces", "info", { title = IDE.name })
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp", "*.c", "*.js", "*.ts", "*.jsx", "*.tsx", "*.cs", "*.java" },
	group = vim.api.nvim_create_augroup("toggle_braces", { clear = true }),
	callback = function(tbl)
		vim.api.nvim_create_user_command("Togglebraces", function()
			toggle_braces()
		end, {})
		vim.keymap.set("n", "<LEADER>tb", toggle_braces, { buffer = tbl.buf })
	end,
})
