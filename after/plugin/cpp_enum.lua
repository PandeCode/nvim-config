local function gen_enum_funcs(enum_name, bufnr)
	enum_name = enum_name or vim.fn.expand "<cword>"
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local ft = vim.bo[bufnr].filetype
	if ft ~= "cpp" and ft ~= "c" then
		vim.notify("Can only be used in c or cpp", "warn", { title = IDE.name })
		return
	end
	local cpp = ft == "cpp"

	local root = TS.get_root(ft, bufnr)
	local enum_data = vim.treesitter.parse_query("cpp", [[
	(enum_specifier
		name: (type_identifier) @name (#eq? @name "]] .. enum_name .. [[")
		(enumerator_list
			(enumerator
				name: (identifier) @items
			)
		)
	) @enum
	]])

	local items = {}
	local start_from = 0

	for id, node in enum_data:iter_captures(root, bufnr, 0, -1) do
		local name = enum_data.captures[id]
		if name == "items" then
			table.insert(items, vim.treesitter.get_node_text(node, bufnr))
		elseif name == "enum" then
			start_from = ({ node:range() })[3] + 2
		end
	end

	if #items == 0 then
		vim.notify("Failed to get enum '" .. enum_name .. "'", "error", { title = IDE.name })
		return
	end

	local err = (function()
		if cpp then
			return 'throw std::invalid_argument("Must be valid type '
				.. enum_name
				.. "::{"
				.. table.concat(items, ", ")
				.. '}");'
		else
			return 'fprintf(stderr, "Must be valid type Options::{Option1, Option2, Option3, Option4, Option5, Option6, Option7, Option8, Option9, Option10, Option11}");abort();'
		end
	end)()

	local lines = {
		"// clang-format off",
		cpp and enum_name .. " " .. enum_name .. "_fromstring(const std::string& str) {"
			or enum_name .. " " .. enum_name .. "_fromstring(const char* str) {",
	}

	for _, value in pairs(items) do
		table.insert(
			lines,
			cpp and '	if(str == "' .. value .. '") return ' .. enum_name .. "::" .. value .. ";"
				or '	if(strcmp(str, "' .. value .. '") == 0) return ' .. enum_name .. "::" .. value .. ";"
		)
	end

	table.insert(lines, "\t" .. err)
	table.insert(lines, "}")
	table.insert(
		lines,
		cpp and "std::string " .. enum_name .. "_tostring(const " .. enum_name .. "& e) {"
			or "const char* " .. enum_name .. "_tostring(const " .. enum_name .. "& e) {"
	)
	table.insert(lines, "	switch(e) {")

	if cpp then
		for _, value in pairs(items) do
			table.insert(lines, "		case " .. enum_name .. "::" .. value .. ': return "' .. value .. '";')
		end
	else
		for _, value in pairs(items) do
			table.insert(lines, "		case " .. enum_name .. "::" .. value .. ': return "' .. value .. '";')
		end
	end

	table.insert(lines, "		default: " .. err)
	table.insert(lines, "	}")
	table.insert(lines, "}")

	if cpp then
		table.insert(lines, "std::ostream& operator<<(std::ostream& stream, const " .. enum_name .. "& e) {")
		table.insert(lines, "	stream << " .. enum_name .. "_tostring(e);")
		table.insert(lines, "	return stream;")
		table.insert(lines, "}")
	end
	table.insert(lines, "// clang-format on")
	table.insert(lines, "")

	vim.api.nvim_buf_set_lines(bufnr, start_from, start_from, false, lines)
	vim.notify("Added enum functions to '" .. enum_name .. "'", "info", { title = IDE.name })
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp", "*.c" },
	group = vim.api.nvim_create_augroup("gen_enum", { clear = true }),
	callback = function(tbl)
		vim.api.nvim_create_user_command("GenEnum", function()
			gen_enum_funcs()
		end, {})
		vim.keymap.set("n", "<LEADER>ge", gen_enum_funcs, { buffer = tbl.buf })
	end,
})
