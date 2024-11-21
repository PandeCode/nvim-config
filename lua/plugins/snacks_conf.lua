local ascii_dir = vim.fn.getenv("NVIM_ASCII_DIR")
local image_dir = vim.fn.getenv("NVIM_IMG_DIR")

local env_header = vim.fn.getenv("NVIM_ASCII")
local header, header_height = nil, nil

if env_header ~= vim.NIL and env_header ~= "" then
	header = vim.fn.readfile(env_header)
	header_height = tonumber(vim.fn.system({ "wc", "-l", env_header }):match("%d+"))
elseif ascii_dir ~= vim.NIL and ascii_dir ~= "" then
	local image_files = listdir(vim.fn.expand(ascii_dir))
	math.randomseed(os.time())
	header = vim.fn.expand(ascii_dir .. image_files[math.random(1, #image_files)])
	header_height = tonumber(vim.fn.system({ "wc", "-l", header }):match("%d+"))
end

local env_image = vim.fn.getenv("NVIM_IMG")
local image_path = nil

if env_image ~= vim.NIL then
	image_path = env_image
elseif image_dir ~= vim.NIL and image_dir ~= "" then
	local image_files = listdir(vim.fn.expand(image_dir))
	math.randomseed(os.time())
	image_path = vim.fn.expand(image_dir .. image_files[math.random(1, #image_files)])
end

require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = {
		enabled = true,
		header = header,
		sections = {
			{
				section = "terminal",
				cmd = "colorscript -e square",
				height = 5,
				padding = 1,
			},

			{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
			{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
			{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },

			{
				icon = " ",
				title = "Git Status",
				section = "terminal",
				enabled = Snacks.git.get_root() ~= nil,
				cmd = "hub status --short --branch --renames",
				height = 5,
				padding = 1,
				ttl = 5 * 60,
				indent = 3,
			},

			{ section = "startup" },

			{
				pane = 2,
				section = "terminal",
				cmd = "cat " .. (header or "/dev/null"),
				height = header_height,
				enabled = header ~= nil,
				padding = 1,
			},
			-- {
			--     enabled = image_path ~= nil,
			--     pane = 2,
			--     section = "terminal",
			--     cmd = "chafa "
			--         .. (image_path or "")
			--         .. " --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
			--     height = 17,
			--     padding = 1,
			-- },
		},
	},
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	quickfile = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			wo = { wrap = true }, -- Wrap notifications
		},
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- Setup some globals for debugging (lazy-loaded)
		_G.dd = function(...)
			Snacks.debug.inspect(...)
		end
		_G.bt = function()
			Snacks.debug.backtrace()
		end
		vim.print = _G.dd -- Override print to use snacks for `:=` command

		Snacks.toggle.treesitter():map("<leader>uT")
		Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		Snacks.toggle.inlay_hints():map("<leader>uh")
	end,
})

local keys = {
	{
		"<leader>gB",
		function()
			Snacks.gitbrowse()
		end,
		desc = "Git Browse",
	},
	{
		"<leader>cR",
		function()
			Snacks.rename.rename_file()
		end,
		desc = "Rename File",
	},
	{
		"]]",
		function()
			Snacks.words.jump(vim.v.count1)
		end,
		desc = "Next Reference",
		mode = { "n", "t" },
	},
	{
		"[[",
		function()
			Snacks.words.jump(-vim.v.count1)
		end,
		desc = "Prev Reference",
		mode = { "n", "t" },
	},
}

for _, value in pairs(keys) do
	vim.keymap.set(Keys.N, value[1], value[2])
end
