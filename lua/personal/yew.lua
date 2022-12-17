local notify = require("notify")

YEW = {
	defaults = {
		components_mod_file = "./src/components_mod_file",
		should_edit_components_mod_file = true,
	},
	commands = {
		-- remove_use_tag             = 's/<use xlink:href="\(.\{-}\)"><\/use>/{"\1"}',
		-- stringify_all_between_tags = 's/>\(.\{-}\)</>{"\1"}<',
		-- convert_single_classes     = 's/class=\("\w\{-}"\)/class={classes!(\1)}',
		-- convert_compound_classes   = 's/class={ \(.\{-}\) }/class={classes!{\1.to_owned()}}',
		-- convert_attributes         = 's/\(\w\{-}\)=\(".\{-}"\)/\1={\2}',
	},
	functions = {
		convert_html = function()
			notify("Not Implemented", "error", { title = "Yew", })
		end,
		new_component = function ()
			notify("Not Implemented", "error", { title = "Yew", })
		end,
		extract_to_new_component = function ()
			notify("Not Implemented", "error", { title = "Yew", })
		end,

	}
}
