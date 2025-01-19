if vim.g.vscode ~= nil then
	return {}
end

local M = {
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			disabled_filetypes = { "qf", "lazy", "oil" },
			disabel_mouse = false,
			hints = {
				["[dcyvV][ia][%(%)]"] = {
					message = function(keys)
						return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
					end,
					length = 3,
				},
				["[dcyvV][ia][%{%}]"] = {
					message = function(keys)
						return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
					end,
					length = 3,
				},
			},
		},
	},
}

return {}
