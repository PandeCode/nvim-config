local name = "sumneko_lua"
local cmd = {"lua-language-server", "--stdio"}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

if not name then
    print "You have not defined a server name, please edit minimal_init.lua"
end

if not NVIM_LSP[name].document_config.default_config.cmd and not cmd then
    print [[You have not defined a server default cmd for a server
      that requires it please edit minimal_init.lua]]
end

--cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};

NVIM_LSP.sumneko_lua.setup {
    cmd = cmd,
    on_attach = ON_ATTACH,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim", "use"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}