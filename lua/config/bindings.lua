vim.g.mapleader = " "

-- stylua: ignore start
local keymaps = {
	{ Keys.N, "<LEADER>sf", vim.cmd.write },
	{ Keys.N, "<LEADER>me", vim.cmd.messages },
	{ Keys.N, "<LEADER>fe", vim.cmd.edit },
	-- Buffer
	{ Keys.N, "<LEADER>bp", vim.cmd.bp },
	{ Keys.N, "<LEADER>bn", vim.cmd.bn },
	{ Keys.N, "<LEADER>bd", vim.cmd.bd },
	{ Keys.N, "<A-d>", vim.cmd.bd, Keys.Noremap },

	{
		Keys.N,
		"<LEADER>x+",
		function()
			local filename = vim.fn.expand("%")
			vim.fn.jobstart({ "chmod", "+x", filename })
			require("notify")("Given execution rights to '" .. filename .. "'", "info", { title = IDE.name })
		end,
	},

	{
		Keys.N,
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
