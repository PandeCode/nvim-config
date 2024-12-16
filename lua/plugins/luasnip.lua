return {
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load() -- For friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.expand "~/.config/nvim/snippets" }

			local ls = require "luasnip"
			local s = ls.snippet
			local sn = ls.snippet_node
			local t = ls.text_node
			local i = ls.insert_node
			local f = ls.function_node
			local c = ls.choice_node
			local d = ls.dynamic_node
			local r = ls.restore_node
			local ls_ex = require "luasnip.extras"
			local l = ls_ex.lambda
			local rep = ls_ex.rep
			local p = ls_ex.partial
			local m = ls_ex.match
			local n = ls_ex.nonempty
			local dl = require("luasnip.extras").dynamic_lambda
			local fmt = require("luasnip.extras.fmt").fmt
			local fmta = require("luasnip.extras.fmt").fmta
			local conds = require "luasnip.extras.expand_conditions"
			local types = require "luasnip.util.types"

			vim.keymap.set({ "i", "s" }, "<c-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)

			local function copy(args)
				return args[1]
			end

			local function get_test_result(pos)
				return d(pos, function()
					local nodes = {}
					table.insert(nodes, "")

					local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
					for _, line in ipairs(lines) do
						if line:match "anyhow::Result" then
							table.insert(nodes, t " --> anyhow::Result ")
							break
						end
					end

					return sn(
						nil,
						c(1, {
							t "",
							t " --> Result<(), ()>",
							fmt(" --> Result<{}, ()>", { i(1) }),
							fmt(" --> Result<{}, {}>", { i(1), i(0) }),
							fmt(" --> Result<(), {}>", { i(1) }),
						})
					)
				end, {})
			end

			ls.setup {
				history = false,
				-- Update more often, :h events for more info.
				updateevents = "TextChanged,TextChangedI",
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { "choiceNode", "Comment" } },
						},
					},
				},
				-- treesitter-hl has 100, use something higher (default is 200).
				ext_base_prio = 300,
				-- minimal increase in priority.
				ext_prio_increase = 1,
				enable_autosnippets = true,
			}

			ls.add_snippets("all", {
				s(
					"todo",
					fmt(
						"{}: {}",
						{ c(1, { t "BUG", t "TODO", t "HACK", t "WARN", t "PERF", t "NOTE", t "TEST" }), i(0) }
					)
				),
				s(
					"time",
					fmt(
						"{}",
						c(1, {
							f(function()
								return os.date "%D -%H:%M"
							end),
							f(function()
								return os.date "%d/%m/%y"
							end),
						})
					)
				),
			})

			ls.add_snippets({ "javascriptreact", "typescriptreact", "javascript", "typescript" }, {
				s(
					"fn",
					fmt(
						[[
function {}({}) {{
	{}
}}
]],
						{
							i(1),
							i(2),
							i(3),
						}
					)
				),
			})

			ls.add_snippets("lua", {
				s(
					"req",
					fmt('local {} = require("{}")', {
						f(function(import_name)
							local parts = vim.split(import_name[1][1], ".", true)
							return parts[#parts] or ""
						end, { 1 }),
						i(1),
					})
				),
				s(
					"reql",
					fmt('local {} = require("{}")', {
						f(function(import_name)
							print(vim.inspect(import_name))
							return vim.split(import_name[1][1], "")[1] or ""
						end, { 1 }),
						i(1),
					})
				),
			})

			ls.add_snippets("rust", {
				s(
					"cfg",
					fmt(
						[[
#[cfg(test)]
mod test {{
{}
	{}
}}
]],
						{
							c(1, { t "\tuse super::*;", t "" }),
							i(0),
						}
					)
				),

				s(
					"test",
					fmt(
						[[
#[test]
fn {}() {}{{
	{}
}}
]],
						{
							i(1),
							get_test_result(2),
							i(0),
						}
					)
				),
			})

			ls.add_snippets("cpp", {
				s(
					"class",
					fmt(
						[[
class {} {{
	public:
		{}
	private:
		{}
}};
]],
						{
							i(1),
							c(2, {
								fmt("Class(){};", {
									c(1, {
										t "",
										t " = default",
										t " = delete",
									}),
								}),
							}),
							i(3),
						}
					)
				),
			})
		end,
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v2.*",
		build = "make install_jsregexp",
	},
}
