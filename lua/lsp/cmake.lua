NVIM_LSP.cmake.setup {
    on_attach = ON_ATTACH,
    capabilities = CAPABILITIES,
    --
    cmd = {"cmake-language-server"},
    filetypes = {"cmake"},
    init_options = {
        buildDirectory = "Debug"
    }
}
