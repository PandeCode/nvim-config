return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.cursorword").setup()
			require("mini.pairs").setup()
			-- require("mini.animate").setup()
			require("mini.align").setup()
			require('mini.move').setup()

			require("mini.surround").setup {
				mappings = {
					add = "ys", -- Add surrounding in Normal and Visual modes
					delete = "ds", -- Delete surrounding
					replace = "cs", -- Replace surrounding

					find = "", -- Find surrounding (to the right)
					find_left = "", -- Find surrounding (to the left)
					highlight = "", -- Highlight surrounding
					update_n_lines = "", -- Update `n_lines`
					suffix_last = "", -- Suffix to search with "prev" method
					suffix_next = "", -- Suffix to search with "next" method
				},
			}

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
					{ mode = "n", keys = "z" },
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
