vim.cmd "source $HOME/.config/nvim/vimscript/plugins/lightline.vim"

vim.g.lightline = {
    colorscheme = "dracula",
    enable = {
        tabline = 0
    },
    separator = {left = vim.g.leftSep, right = vim.g.rightSep},
    subseparator = {left = vim.g.leftSubSep, right = vim.g.rightSubSep},
    active = {
        left = {
            {"mode", "paste"},
            {"LightlineReadonly", "LightlineFileName", "modified"},
            {"LightlineNearestMethodOrFunction", "LightlineTreesitter"}
        },
        right = {
            {"charvaluehex", "lineinfo", "linenumber"},
            {"coc_error", "coc_warning", "coc_hint", "coc_info"},
            {"LightlineFileFormat", "LightlineFileType"},
            {"LightlineCMakeStat", "LightlineFugitive"}
        }
    },
    component = {
        charvaluehex = "0x%B",
        lineinfo = "%3l=%-2v%<"
    },
    component_function = {
        LightlineCMakeStat = "LightlineCMakeStat",
        LightlineFileFormat = "LightlineFileFormat",
        LightlineFileType = "LightlineFileType",
        LightlineFileName = "LightlineFileName",
        LightlineFugitive = "LightlineFugitive",
        LightlineLineNumber = "LightlineLineNumber",
        LightlineNearestMethodOrFunction = "LightlineNearestMethodOrFunction",
        LightlineReadonly = "LightlineReadonly",
        LightlineTreesitter = "nvim_treesitter#statusline"
    },
    component_expand = {
        coc_error = "LightlineCocErrors",
        coc_warning = "LightlineCocWarnings",
        coc_info = "LightlineCocInfos",
        coc_hint = "LightlineCocHints",
        coc_fix = "LightlineCocFixes"
    },
    component_type = {
        coc_error = "error",
        coc_warning = "warning",
        coc_info = "tabsel",
        coc_hint = "middle",
        coc_fix = "middle"
    }
}
