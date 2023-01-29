local notify = require("notify")
local function get_root(bufnr)
	local parser = vim.treesitter.get_parser(bufnr, "cpp", {})
	local tree = parser:parse()[1]
	return tree:root()
end

local function gen_enum_funcs(enum_name, bufnr)
	enum_name = enum_name or vim.fn.expand("<cword>")
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if vim.bo[bufnr].filetype ~= "cpp" then
		notify("Can only be used in cpp", "warn", { title = IDE.name })
		return
	end

	local root = get_root(bufnr)
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
		notify("Failed to get enum '" .. enum_name .. "'", "error", { title = IDE.name })
		return
	end

	local lines = {
		"// clang-format off",
		enum_name .. " " .. enum_name .. "_fromstring(const std::string& str) {",
	}

	for _, value in pairs(items) do
		table.insert(lines, '	if(str == "' .. value .. '") return ' .. enum_name .. "::" .. value .. ";")
	end

	table.insert(
		lines,
		'	throw std::invalid_argument("Must be valid type ' .. enum_name .. "::{" .. table.concat(items, ", ") .. '}");'
	)
	table.insert(lines, "}")
	table.insert(lines, "std::string " .. enum_name .. "_tostring(const " .. enum_name .. "& e) {")
	table.insert(lines, "	switch(e) {")

	for _, value in pairs(items) do
		table.insert(lines, "		case " .. enum_name .. "::" .. value .. ': return "' .. value .. '";')
	end

	table.insert(
		lines,
		'		default: throw std::invalid_argument("Must be valid type '
			.. enum_name
			.. "::{"
			.. table.concat(items, ", ")
			.. '}");'
	)
	table.insert(lines, "	}")
	table.insert(lines, "}")
	table.insert(lines, "std::ostream& operator<<(std::ostream& stream, const " .. enum_name .. "& e) {")
	table.insert(lines, "	stream << " .. enum_name .. "_tostring(e);")
	table.insert(lines, "	return stream;")
	table.insert(lines, "}")
	table.insert(lines, "// clang-format on")

	vim.api.nvim_buf_set_lines(bufnr, start_from, start_from, false, lines)
	notify("Added enum functions to '" .. enum_name .. "'", "ERROR", { title = IDE.name })
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.cpp" },
	group = vim.api.nvim_create_augroup("gen_enum", { clear = true }),
	callback = function(tbl)
		vim.api.nvim_create_user_command("GenEnum", function()
			gen_enum_funcs()
		end, {})
		vim.keymap.set("n", "<LEADER>ge", gen_enum_funcs, { buffer = tbl.buf })
	end,
})
