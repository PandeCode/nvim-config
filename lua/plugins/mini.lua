return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		priority = 999,
		config = function()
			require("mini.cursorword").setup()
			require("mini.pairs").setup()
			require("mini.align").setup()
			require("mini.move").setup()
			require("mini.splitjoin").setup()
			require("mini.trailspace").setup()

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("disable_mini_plugins", { clear = true }),
				pattern = { "snacks_dashboard" },
				callback = function(data)
					vim.b[data.buf].minitrailspace_disable = true
					vim.api.nvim_buf_call(data.buf, MiniTrailspace.unhighlight)
				end,
			})

			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = "*",
				callback = function()
					MiniTrailspace.trim()
					MiniTrailspace.trim_last_lines()
				end,
			})

			local ts_input = require("mini.surround").gen_spec.input.treesitter

			require("mini.surround").setup {
				mappings = {
					add = "ys",
					delete = "ds",
					find = "",
					find_left = "",
					highlight = "",
					replace = "cs",
					update_n_lines = "",

					-- Add this only if you don't want to use extended mappings
					suffix_last = "",
					suffix_next = "",
				},
				search_method = "cover_or_next",
				custom_surroundings = {
					f = {
						input = ts_input { outer = "@call.outer", inner = "@call.inner" },
					},

					b = {
						input = ts_input { outer = "@block.out", inner = "@block.inner" },
					},

					-- Make `)` insert parts with spaces. `input` pattern stays the same.
					[")"] = { output = { left = "( ", right = " )" } },

					-- Use function to compute surrounding info
					["*"] = {
						input = function()
							local n_star = MiniSurround.user_input "Number of * to find"
							local many_star = string.rep("%*", tonumber(n_star) or 1)
							return { many_star .. "().-()" .. many_star }
						end,
						output = function()
							local n_star = MiniSurround.user_input "Number of * to output"
							local many_star = string.rep("*", tonumber(n_star) or 1)
							return { left = many_star, right = many_star }
						end,
					},
				},
			}

			-- Remap adding surrounding to Visual mode selection
			vim.keymap.del("x", "ys")
			vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

			-- Make special mapping for "add surrounding for line"
			vim.keymap.set("n", "yss", "ys_", { remap = true })

			local hipatterns = require "mini.hipatterns"

			hipatterns.setup {
				highlighters = {
					-- vec3(1.0, 0.5, 0.0)

					vec3 = {
						pattern = "vec3%([%.%d%s,]*%)",
						group = function(_, _, data)
							local r, g, b = data.full_match:match "%((.*),(.*),(.*)%)"
							if not r or not g or not b then
								return nil
							end
							return hipatterns.compute_hex_color_group(
								string.format(
									"#%02X%02X%02X",
									math.min(math.max(math.floor(tonumber(r) * 255), 0), 255),
									math.min(math.max(math.floor(tonumber(g) * 255), 0), 255),
									math.min(math.max(math.floor(tonumber(b) * 255), 0), 255)
								),
								"bg"
							)
						end,
					},

					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					error = { pattern = "%f[%w]()ERROR()%f[%W]", group = "MiniHipatternsFixme" },
					err = { pattern = "%f[%w]()ERR()%f[%W]", group = "MiniHipatternsFixme" },
					bug = { pattern = "%f[%w]()BUG()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					warn = { pattern = "%f[%w]()WARN()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
					info = { pattern = "%f[%w]()INFO()%f[%W]", group = "MiniHipatternsNote" },

					base00 = { pattern = "base00", group = "GP_base00" },
					base01 = { pattern = "base01", group = "GP_base01" },
					base02 = { pattern = "base02", group = "GP_base02" },
					base03 = { pattern = "base03", group = "GP_base03" },
					base04 = { pattern = "base04", group = "GP_base04" },
					base05 = { pattern = "base05", group = "GP_base05" },
					base06 = { pattern = "base06", group = "GP_base06" },
					base07 = { pattern = "base07", group = "GP_base07" },
					base08 = { pattern = "base08", group = "GP_base08" },
					base09 = { pattern = "base09", group = "GP_base09" },
					base0A = { pattern = "base0A", group = "GP_base0A" },
					base0B = { pattern = "base0B", group = "GP_base0B" },
					base0C = { pattern = "base0C", group = "GP_base0C" },
					base0D = { pattern = "base0D", group = "GP_base0D" },
					base0E = { pattern = "base0E", group = "GP_base0E" },
					base0F = { pattern = "base0F", group = "GP_base0F" },

					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			}

			local miniclue = require "mini.clue"
			miniclue.setup {
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					-- { mode = "n", keys = "z" }, -- FIXME: Disables z<CR>
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			}
		end,
	},
}
