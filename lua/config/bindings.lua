vim.g.mapleader = " "
local n = Keys.N

-- stylua: ignore start
local keymaps = {
	{ n, "<LEADER>sf", vim.cmd.write },
	{ n, "<LEADER>me", vim.cmd.messages },
	{ n, "<LEADER>fe", vim.cmd.edit },
	-- Buffer
	{ n, "<LEADER>bp", vim.cmd.bp },
	{ n, "<LEADER>bn", vim.cmd.bn },
	{ n, "<LEADER>bd", vim.cmd.bd },
	{ n, "<A-d>", vim.cmd.bd, Keys.Noremap },

	{
		n,
		"<LEADER>x+",
		function()
			local filename = vim.fn.expand("%")
			vim.fn.jobstart({ "chmod", "+x", filename })
			require("notify")("Given execution rights to '" .. filename .. "'", "info", { title = IDE.name })
		end,
	},

	{
		n,
		"<LEADER>x-",
		function()
			local filename = vim.fn.expand("%")
			vim.fn.jobstart({ "chmod", "-x", filename })
			require("notify")("Taken away execution rights from '" .. filename .. "'", "info", { title = IDE.name })
		end,
	},
}

for _, value in pairs(keymaps) do
	vim.keymap.set(value[1], value[2], value[3], value[4] or Keys.None)
end
