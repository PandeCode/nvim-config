local ascii_dir = vim.fn.getenv "NVIM_ASCII_DIR"
local image_dir = vim.fn.getenv "NVIM_IMG_DIR"

local env_header = vim.fn.getenv "NVIM_ASCII"
local header = nil

if env_header ~= vim.NIL and env_header ~= "" then
	header = vim.fn.readfile(env_header)
elseif ascii_dir ~= vim.NIL and ascii_dir ~= "" then
	image_files = FFI_RUST.list_dir(vim.fn.expand(ascii_dir))
	if image_files ~= nil then
		math.randomseed(os.time())
		header = table.concat(image_files[math.random(1, #image_files)], "\n")
	end
end

local env_image = vim.fn.getenv "NVIM_IMG"
local image_path = nil

if env_image ~= vim.NIL then
	image_path = env_image
elseif image_dir ~= vim.NIL and image_dir ~= "" then
	image_files = FFI_RUST.list_dir(vim.fn.expand(image_dir))
	if image_files ~= nil then
		new_image_files = {}
		for _, value in pairs(image_files) do
			local l = #value
			if l > 4 then
				if FFI_RUST.is_image(value) then
					table.insert(new_image_files, value)
				end
			end
		end
		if #new_image_files > 0 then
			math.randomseed(os.time())
			image_path = new_image_files[math.random(1, #new_image_files)]
		end
	end
end

local dashboard_config = {
	preset = { header = header },

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
			enabled = vim.fn.isdirectory ".git" == 1,
			cmd = "hub status --short --branch --renames",
			height = 5,
			padding = 1,
			ttl = 5 * 60,
			indent = 3,
		},

		{ section = "startup" },

		{ section = "header", pane = 2 },

		{
			enabled = image_path ~= nil,
			pane = 2,
			section = "terminal",
			cmd = "chafa "
				.. (image_path or "")
				.. " --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
			height = 17,
			padding = 1,
		},
	},
}

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type Snacks.Config
		opts = {
			dashboard = dashboard_config,

			animate = {},
			scroll = {},
			zen = {},
			bigfile = {},
			notifier = {},
			quickfile = {},
			words = {},
			statuscolumn = {},
			indent = {
				enabled = true,
				indent = {
					-- blank = { char = "  > " },
					-- only_scope = true,
					-- only_current = true,
					hl = {
						"RainbowRed",
						"RainbowYellow",
						"RainbowBlue",
						"RainbowOrange",
						"RainbowGreen",
						"RainbowViolet",
						"RainbowCyan",
					},
				},
				-- blank = "∙",
				chunk = {
					char = {
						corner_top = "╭",
						corner_bottom = "╰",
					},
				},
			},
		},
		keys = {
			-- stylua: ignore start
			{ "<leader>zm",  function() Snacks.zen() end,                     desc = "Toggle Zen Buffer",        },
			{ "<leader>.",   function() Snacks.scratch() end,                 desc = "Toggle Scratch Buffer",        },
			{ "<leader>S",   function() Snacks.scratch.select() end,          desc = "Select Scratch Buffer",        },
			{ "<leader>nh",  function() Snacks.notifier.show_history() end,   desc = "Notification History",         },
			{ "<leader>bd",  function() Snacks.bufdelete() end,               desc = "Delete Buffer",                },
			{ "<leader>cR",  function() Snacks.rename.rename_file() end,      desc = "Rename File",                  },
			{ "<leader>giB", function() Snacks.gitbrowse() end,               desc = "Git Browse",                   },
			{ "<leader>gib", function() Snacks.git.blame_line() end,          desc = "Git Blame Line",               },
			{ "<leader>gif", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History", },
			{ "<leader>gig", function() Snacks.lazygit() end,                 desc = "Lazygit",                      },
			{ "<leader>gil", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)",            },
			{ "<leader>un",  function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications",    },
			{ "]]",          function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",               mode = { "n", "t" }, },
			{ "[[",          function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",               mode = { "n", "t" }, },
			-- stylua: ignore end

			{
				"<leader>N",
				desc = "Neovim News",
				function()
					Snacks.win {
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					}
				end,
			},
		},
		init = function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })

			vim.g.rainbow_delimiters = { highlight = highlight }

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

					Snacks.toggle.profiler():map "<leader>pp"
					Snacks.toggle.profiler_highlights():map "<leader>ph"
					Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
					Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
					Snacks.toggle.diagnostics():map "<leader>ud"
					Snacks.toggle.line_number():map "<leader>ul"
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map "<leader>uc"
					Snacks.toggle.treesitter():map "<leader>uT"
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map "<leader>ub"
					Snacks.toggle.inlay_hints():map "<leader>uh"
				end,
			})
		end,
	},
}
