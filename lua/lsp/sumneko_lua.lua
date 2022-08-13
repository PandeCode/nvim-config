-- local runtime_path = vim.split(package.path, ";")
-- local runtime_path = {}

lua_type = "normal"

local cwd = vim.fn.getcwd()

local globals = {}
local libraries = {}
local runtime_path = {}
local version = "Lua 5.4"

if cwd == "/home/shawn/.config/nvim" or cwd == "/home/shawn/dotfiles/config/nvim" then
	lua_type = "nvim"

	globals = { "vim", "use", "use_rocks" }
	libraries = vim.api.nvim_get_runtime_file("", true)
	runtime_path = vim.split(package.path, ";")
	version = "Lua5.1"
elseif cwd == "/home/shawn/.config/awesome" or cwd == "/home/shawn/dotfiles/config/awesome" then
	lua_type = "awesome"

	globals = { "awesome", "tag", "screen", "client", "taglist_buttons", "mouse" }
	libraries = { "/usr/share/awesome/lib", vim.fn.expand("$HOME/.config/awesome") }
	runtime_path = {
		"/usr/share/awesome/lib/?.lua",
		"/usr/share/awesome/lib/?/init.lua",
		vim.fn.expand("$HOME/.config/awesome/?.lua"),
		vim.fn.expand("$HOME/.config/awesome/?/init.lua"),
	}
	version = "Lua 5.4"
end

table.insert(runtime_path, "?.lua")
table.insert(runtime_path, "?/init.lua")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

NVIM_LSP.sumneko_lua.setup({
	on_attach = ON_ATTACH,
	capabilities = CAPABILITIES,
	flags = FLAGS,
	--
	cmd = { "lua-language-server", "--stdio" },
	settings = {
		Lua = {
			runtime = {
				version = version,
				path = runtime_path,
			},
			diagnostics = {
				globals = globals,
				disable = { "lowercase-global" },
			},
			workspace = { library = libraries }, -- Make the server aware of  runtime files
			-- send telemetry data containing a randomized but unique identifier
			telemetry = { enable = true },
		},
	},
})
