vim.api.nvim_set_keymap("n", "<space>tf", "<cmd>Telescope find_files<cr>",                                     {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tl", "<cmd>Telescope live_grep<cr>",                                      {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tb", "<cmd>Telescope buffers<cr>",                                        {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>th", "<cmd>Telescope help_tags<cr>",                                      {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tt", "<cmd>Telescope colorsheme<cr>",                                     {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcm", "<cmd>Telescope coc mru<cr>",                                       {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcl", "<cmd>Telescope coc links<cr>",                                     {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcc", "<cmd>Telescope coc commands<cr>",                                  {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcr", "<cmd>Telescope coc references<cr>",                                {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tdef", "<cmd>Telescope coc definitions<cr>",                              {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tdec", "<cmd>Telescope coc declarations<cr>",                             {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tci", "<cmd>Telescope coc implementations<cr>",                           {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tct", "<cmd>Telescope coc type_definitions<cr>",                          {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcd", "<cmd>Telescope coc diagnostics<cr>",                               {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcc", "<cmd>Telescope coc code_actions<cr>",                              {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcl", "<cmd>Telescope coc line_code_actions<cr>",                         {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcf", "<cmd>Telescope coc file_code_actions<cr>",                         {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcd", "<cmd>Telescope coc document_symbols<cr>",                          {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcws", "<cmd>Telescope coc workspace_symbols<cr>",                        {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tcwd", "<cmd>Telescope coc workspace_diagnostics<cr>",                    {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tutl", "<cmd>Telescope ultisnips<cr>",                                    {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tnml", "<cmd>Telescope node_modules list<cr>",                            {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tmf", "<cmd>Telescope media_files<cr>",                                   {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tgi", "<cmd>Telescope gh issues<cr>",                                     {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tgpr", "<cmd>Telescope gh pull_request<cr>",                              {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tgg", "<cmd>Telescope gh gist<cr>",                                       {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tgr", "<cmd>Telescope gh run<cr>",                                        {noremap= true, silent=true})
vim.api.nvim_set_keymap("n", "<space>tss", "<cmd>Telescope session-lens search_session<cr>",                   {noremap= true, silent=true})

vim.api.nvim_set_keymap("n", "<space>tvim", "lua require('telescope').extensions.vimspector.configurations()", {noremap= true, silent=true})

require("telescope").setup {
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "webm", "pdf", "mp4", "jpg", "jpeg", "mp3"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false
            },
            vertical = {
                mirror = false
            }
        },
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        path_display = true,
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    }
}

--require("telescope").load_extension("vimspector")
require("telescope").load_extension("gh")
require("telescope").load_extension("media_files")
--require("telescope").load_extension("node_modules")
--require("telescope").load_extension("ultisnips")
