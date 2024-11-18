local notify = vim.notify

YEW = {
	silent_global = "silent %",
	silent_select = "silent '<,'>",
	defaults = {
		components_mod_file = "./src/components.rs",
		should_edit_components_mod_file = true,
	},
	commands = {
		remove_use_tag = [[s/<use xlink:href="\(.\{-}\)"><\/use>/\1]],
		convert_single_classes = [[s/class=\("\w\{-}"\)/class={classes!(\1)}]],
		convert_compound_classes = [[s/class=\(".\{-}"\)/class={classes!(\1.to_owned())}]],
		stringify_all_between_tags = [[s/>\(.\{-}\)</>{"\1"}<]],
		fix_single_tags = [[s/<\(hr\|br\)\(.\{-}\)>/<\1\2/>]],
		remove_blanka = [[s/>{""}</><]],
	},
	functions = {
		convert_html_global = function()
			for _, value in pairs(YEW.commands) do
				vim.cmd(YEW.silent_global .. value)
			end
			notify("Converted html globally", "info", { title = "Yew" })
		end,

		convert_html_selection = function()
			for _, value in pairs(YEW.commands) do
				vim.cmd(YEW.silent_select .. value)
			end
			notify("Converted html selection", "info", { title = "Yew" })
		end,

		reload = function()
			vim.cmd([[source ~/.config/nvim/lua/personal/yew.lua]])
			notify("Reloading Yew tools", "info", { title = "Yew" })
		end,

		edit = function()
			vim.cmd([[edit ~/.config/nvim/lua/personal/yew.lua]])
		end,

		new_component = function(name)
			notify("Not Implemented", "error", { title = "Yew" })
		end,
		extract_to_variable = function()
			notify("Not Implemented", "error", { title = "Yew" })
		end,
		extract_to_new_component = function()
			notify("Not Implemented", "error", { title = "Yew" })
		end,
	},
}
