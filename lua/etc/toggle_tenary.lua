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
		if name == "ternary" then
			R.range = { node:range() }
			local start_row, start_col, end_row, end_col = unpack(R.range)
			start_row = start_row + 1
			end_row = end_row + 1

			if
				(
					cursor_row >= start_row
					and cursor_row <= end_row
					and cursor_col >= start_col
					and cursor_col <= end_col
				) or (start_row ~= end_row and cursor_row > start_row and cursor_row < end_row)
			then
				R.condition_text = vim.treesitter.get_node_text(node:child(0), bufnr)
				R.consequence_text = vim.treesitter.get_node_text(node:child(2), bufnr)
				R.alternative_text = vim.treesitter.get_node_text(node:child(4), bufnr)
			end
		end
	end

	if R.range ~= nil and R.condition_text ~= nil and R.consequence_text ~= nil and R.alternative_text ~= nil then
		notify(vim.inspect(R))
		return R
	else
		notify(
			"Failed to fullfill {range, condition_text, consequence_text, alternative_text} = " .. vim.inspect({ R }),
			"warn",
			{ title = IDE.name }
		)
		return nil
	end
end

local function toggle_ternary()
	local bufnr = vim.api.nvim_get_current_buf()
	local ft = vim.bo[bufnr].filetype

	if ft == "cpp" or ft == "c" or ft == "csharp" then
		local text = get_text(
			ft,
			[[ (conditional_expression condition: (_) @condition consequence: (_) @consequence alternative: (_) @alternative) @ternary ]]
		)
		if text == nil then
			return
		end

		if ft == "cpp" then
			vim.api.nvim_buf_set_text(bufnr, text.range[1], text.range[2], text.range[3], text.range[4], {
				"([&](){if(" .. text.condition_text .. ") {",
				"return " .. text.consequence_text .. ";",
				"} else {",
				"return " .. text.alternative_text .. ";",
				"}})();",
			})
		end
	elseif
		ft == "typescript"
		or ft == "javascript"
		or ft == "typescriptreact"
		or ft == "javascriptreact"
		or ft == "java"
	then
		local text = get_text(
			ft,
			[[ (ternary_expression condition: (_) @condition consequence: (_) @consequence alternative: (_) @alternative) @ternary ]]
		)
		if text == nil then
			return
		end
	else
		notify("Can only be used in " .. vim.inspect(langs), "warn", { title = IDE.name })
		return
	end

	notify("Toggled ternary", "info", { title = IDE.name })
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp", "*.c", "*.js", "*.ts", "*.jsx", "*.tsx", "*.cs", "*.java" },
	group = vim.api.nvim_create_augroup("toggle_ternary", { clear = true }),
	callback = function(tbl)
		vim.api.nvim_create_user_command("ToggleTernary", function()
			toggle_ternary()
		end, {})
		vim.keymap.set("n", "<LEADER>tt", toggle_ternary, { buffer = tbl.buf })
	end,
})
