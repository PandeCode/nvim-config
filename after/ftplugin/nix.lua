vim.keymap.set("n", "<leader>ex", function()
	local binding_node = TS.GetNodeAtCursorByName "binding"
	local attrpath_node = TS.GetNodeAtCursorByName "attrpath"
	local attr_node = TS.GetNodeAtCursorByName "identifier"

	if binding_node == nil or attrpath_node == nil or attr_node == nil then
		return
	end

	local attr = vim.treesitter.get_node_text(attr_node, 0)
	local expression = vim.treesitter.get_node_text(binding_node:child(2), 0)
	local attrpath = Func.filter(
		Func.map(TS.GetNodeChildren(attrpath_node), function(child)
			return vim.treesitter.get_node_text(child, 0)
		end),
		function(text)
			return text ~= nil and text ~= "."
		end
	)

	local final_str = ""
	local found = false
	for i, child in ipairs(attrpath) do
		if attr ~= child then
			if not found then
				final_str = final_str .. child .. "."
			else
				final_str = final_str .. child
				if i ~= #attrpath then
					final_str = final_str .. "."
				end
			end
		elseif attr == child then
			if i == #attrpath then
				return vim.notify("Final node, Cannot Expand", vim.log.levels.WARN)
			end
			final_str = final_str .. child .. " = { \n"
			found = true
		end
	end
	final_str = final_str .. " = " .. expression .. ";\n };"

	local start_row, start_col, end_row, end_col = binding_node:range()
	vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, vim.fn.split(final_str, "\n"))

	vim.notify "Set expanded!"
end, { noremap = true, silent = true })
