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

}
