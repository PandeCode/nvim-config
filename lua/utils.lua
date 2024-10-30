IDE = { name = "Charon: Ferryman of the dead", description = "Personal Configuration of neovim" }

function RandFrom(list)
	return list[math.random(1, #list)]
end

function TableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

function RandStr(length)
	local res = ""
	for _ = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

function GetVisualSelection()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	return table.concat(lines, "\n")
end

function Dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. Dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

function PrintError(text)
	vim.cmd.echohl({ args = { "ErrorMsg" } })
	vim.cmd.echomsg({ args = { "'" .. text .. "'" } })
	vim.cmd.echohl({ args = { "None" } })
end

function Srequire(path)
	local status, lib = xpcall(require, function(...)
		-- print(...)
	end, path)
	if status then
		return lib
	else
		return nil
	end
end

function Prequire(path)
	local status, lib = xpcall(require, function(...)
		print(...)
	end, path)
	if status then
		return lib
	else
		-- print("Error Loading: '" .. path .. "'")
		PrintError("Error Loading: '" .. path .. "'")
		return nil
	end
end

function RequireForFileType(ft, module)
	if type(ft) == "table" then
		ft = table.concat(ft, ",")
	end

	vim.api.nvim_create_autocmd({ "Filetype" }, {
		pattern = ft,
		callback = function()
			Prequire(module)
		end,
	})
end

function RunForFileType(ft, func)
	if type(ft) == "table" then
		ft = table.concat(ft, ",")
	end

	vim.api.nvim_create_autocmd({ "Filetype" }, {
		pattern = ft,
		callback = func
	})
end

function RequireForPattern(pattern, module)
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		pattern = pattern,
		callback = function()
			Prequire(module)
		end,
	})
end

function RequireFn(file)
	return function()
		Prequire(file)
	end
end

function RequireSetupFn(file, tbl)
	return function()
		Prequire(file).setup(tbl or {})
	end
end

Keys = {
	C = "c",
	I = "i",
	X = "x",
	N = "n",
	S = "s",
	V = "v",
	A = "",

	NX = { "n", "x" },

	None = {},
	Expr = { expr = true },
	Silent = { silent = true },
	SilentExpr = { expr = true, silent = true },
	Noremap = { noremap = true },
	NoremapExpr = { noremap = true, expr = true },
	NoremapSilent = { noremap = true, silent = true },
	NoremapSilentExpr = { noremap = true, expr = true, silent = true },
	NoremapSilentExprScript = {
		noremap = true,
		silent = true,
		script = true,
		expr = true,
	},
}

---A helper function to print a table's contents.
---@param tbl table @The table to print.
---@param depth number @The depth of sub-tables to traverse through and print.
---@param n number @Do NOT manually set this. This controls formatting through recursion.
function PrintTable(tbl, depth, n)
	n = n or 0
	depth = depth or 5

	if depth == 0 then
		print(string.rep(" ", n) .. "...")
		return
	end

	if n == 0 then
		print(" ")
	end

	for key, value in pairs(tbl) do
		if key and type(key) == "number" or type(key) == "string" then
			key = string.format('["%s"]', key)

			if type(value) == "table" then
				if next(value) then
					print(string.rep(" ", n) .. key .. " = {")
					PrintTable(value, depth - 1, n + 4)
					print(string.rep(" ", n) .. "},")
				else
					print(string.rep(" ", n) .. key .. " = {},")
				end
			else
				if type(value) == "string" then
					value = string.format('"%s"', value)
				else
					value = tostring(value)
				end

				print(string.rep(" ", n) .. key .. " = " .. value .. ",")
			end
		end
	end

	if n == 0 then
		print(" ")
	end
end


TS = {}

--- Get root node for file
---@param type string treesitter parser eg cpp, c, java
---@param bufnr number? buffer number {default current buffer}
---@return TSNode | nil
TS.get_root = function(type, bufnr)
	local parser = vim.treesitter.get_parser(bufnr, type, {})
	local tree = parser:parse()[1]
	return tree:root()
end

--- Find parent node of given type.
---@param node TSNode
---@param type string
---@return TSNode | nil
TS.find_parent_node = function(node, type)
	if (node == node:root()) then return nil end
	if (node:type() == type) then return node end
	return TS.find_parent_node(node:parent(), type)
end

--- Find child node of given type.
---@param node TSNode
---@param type string
---@return TSNode | nil
TS.find_child_node = function(node, type)
	local child = node:child(0)
	while child do
		if (child:type() == type) then return child end
		child = child:next_sibling()
	end
	return nil
end

--- Set text of given node.
---@param node TSNode
---@param text string | table
---@param bufnr number | nil
TS.set_node_text = function(node, text, bufnr)
	local sr, sc, er, ec = node:range()
	local content = { text }
	if (type(text) == 'table') then content = text end
	vim.api.nvim_buf_set_text(bufnr or 0, sr, sc, er, ec, content)
end

--- Get text of given node.
---@param node TSNode
---@param bufnr number | nil
---@return string | string[]
TS.get_node_text = function(node, bufnr)
	local sr, sc, er, ec = node:range()
	local text = vim.api.nvim_buf_get_text(bufnr or 0, sr, sc, er, ec, {})
	if (#text == 1) then return text[1] end
	return text
end
