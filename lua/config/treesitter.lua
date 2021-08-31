vim.cmd "source $HOME/.config/nvim/vimscript/config/treesitter.vim"

require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "comment",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "fish",
        "gdscript",
        "go",
        "gomod",
        "graphql",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json5",
        "kotlin",
        "lua",
        "python",
        "regex",
        "rst",
        "ruby",
        "rust",
        "scss",
        "surface",
        "svelte",
        "teal",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml"
    },
    ignore_install = {}, -- List of parsers to ignore installing
    indent = {
        enable = true
    },
    highlight = {
        enable = true,
        disable = {}, -- list of language that will be disabled
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier"
        },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    }
}
