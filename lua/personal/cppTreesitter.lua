local ts_utils = require 'nvim-treesitter.ts_utils'

local enumName = [[
(enum_specifier
	name: (type_identifier) @capture
)
]]

local enumValues = [[
(enum_specifier
	(enumerator_list
		(enumerator
			(identifier) @capture
		)
	) 
)
]]

function parseCpp()
	local parsedName = vim.treesitter.parse_query("cpp", enumName)
	local parsedValues = vim.treesitter.parse_query("cpp", enumValues)

	print("name: ")
	PrintTable(parsedName)

	print("\nvalues: ")
	PrintTable(parsedValues)
end
