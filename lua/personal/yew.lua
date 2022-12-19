local notify = require("notify")

YEW = {
	defaults = {
		components_mod_file = "./src/components_mod_file",
		should_edit_components_mod_file = true,
	},
	commands = {
		remove_use_tag             = [[%s/<use xlink:href="\(.\{-}\)"><\/use>/\1]],
		convert_single_classes     = [[%s/class=\("\w\{-}"\)/class={classes!(\1)}]],
		convert_compound_classes   = [[%s/class=\(".\{-}"\)/class={classes!(\1.to_owned())}]],
		stringify_all_between_tags = [[%s/>\(.\{-}\)</>{"\1"}<]],
		fix_single_tags            = [[%s/<\(hr\|br\)\(.\{-}\)>/<\1\2/>]],
		remove_blanks              = [[%s/>{""}</><]]
		-- convert_attributes         = 's/\(\w\{-}\)=\(".\{-}"\)/\1={\2}',
	},
	functions = {
		convert_html = function()

			vim.cmd(YEW.commands.remove_use_tag);
			vim.cmd(YEW.commands.convert_single_classes);
			vim.cmd(YEW.commands.convert_compound_classes);
			vim.cmd(YEW.commands.stringify_all_between_tags);
			vim.cmd(YEW.commands.remove_blanks);
			-- vim.cmd(YEW.commands.fix_single_tags);

			notify("Converted", "info", { title = "Yew", })
		end,
		new_component = function ()
			notify("Not Implemented", "error", { title = "Yew", })
		end,
		extract_to_new_component = function ()
			notify("Not Implemented", "error", { title = "Yew", })
		end,

	}
}
