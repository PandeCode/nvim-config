NVIM_LSP.bashls.setup {
    on_attach = ON_ATTACH,
    --
    cmd = {"bash-language-server", "start"},
    cmd_env = {
        GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
    },
    filetypes = {"sh"}
    --root_dir = vim's starting directory
}
