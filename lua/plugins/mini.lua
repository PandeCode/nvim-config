return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			-- require("mini.animate").setup()
			-- require("mini.notify").setup()

			require("mini.cursorword").setup()
			require("mini.pairs").setup()
			require("mini.align").setup()
			require("mini.move").setup()

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
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
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
