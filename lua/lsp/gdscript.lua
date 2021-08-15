NVIM_LSP.gdscript.setup {
    on_attach = ON_ATTACH,
    capabilities = CAPABILITIES,
    --

    cmd = {"nc", "localhost", "6008"},
    filetypes = {"gd", "gdscript", "gdscript3"}

    --root_dir = util.root_pattern("project.godot", ".git")
}
