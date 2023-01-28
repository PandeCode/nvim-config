function RandFrom(list)
	return list[math.random(1, #list)]
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
  return table.concat(lines, '\n')
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

function Prequire(path)
	local status, lib = pcall(require, "path")
	if status then
		return lib
	else
		PrintError("Error Loading: '" .. path .. "'")
		return nil
	end
end

function RequireForFileType(ft, module)
	vim.api.nvim_create_autocmd({
		"Filetype",
	}, {
		pattern = ft,
		callback = function()
			require(module)
		end,
	})
end

function RequireForPattern(pattern, module)
	vim.api.nvim_create_autocmd({
		"BufEnter",
	}, {
		pattern = pattern,
		callback = function()
			require(module)
		end,
	})
end

function RequireFn(file)
	return function()
		require(file)
	end
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
