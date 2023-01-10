function RandFrom(list)
	return list[math.random(1, #list)]
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

function RequireForFileType(ft, module)
	vim.cmd("autocmd Filetype " .. ft .. " lua require('" .. module .. "')")
end

function RequireForPattern(pattern, module)
	vim.cmd("autocmd BufEnter " .. pattern .. " lua require('" .. module .. "')")
end

Keys = {
	C = "c",
	I = "i",
	X = "x",
	N = "n",
	S = "s",
	V = "v",
	NoneStr = "",

	None = {},
	Expr = { expr = true },
	Silent = { silent = true },
	SilentExpr = { expr = true, silent = true },
	Noremap = { noremap = true },
	NoremapExpr = { noremap = true, expr = true },
	NoremapSilent = { noremap = true, silent = true },
	NoremapSilentExpr = { noremap = true, expr = true, silent = true },
	NoremapSilentExprScript = { noremap = true, silent = true, script = true, expr = true },
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
