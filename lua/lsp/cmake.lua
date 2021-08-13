local name = "cmake"

local cmd = {"cmake-language-server"}
local filetypes = {"cmake"}
local init_options = {
    buildDirectory = "Debug"
}

if not name then
    print "You have not defined a server name, please edit minimal_init.lua"
end

if not NVIM_LSP[name].document_config.default_config.cmd and not cmd then
    print [[You have not defined a server default cmd for a server
      that requires it please edit minimal_init.lua]]
end

NVIM_LSP[name].setup {
    cmd = cmd,
    on_attach = ON_ATTACH,
    filetypes = filetypes,
    init_options = init_options
}
