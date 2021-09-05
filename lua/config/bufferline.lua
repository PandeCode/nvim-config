vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        numbers = "ordinal",
        -- "none" | "ordinal" | "buffer_id" | "both",
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match("%.md") then
                return vim.fn.fnamemodify(buf.name, ":t:r")
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp", -- false | "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
        end,
        offsets = {filetype = "NvimTree", text = "File Explorer"}, -- {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "slant", -- "slant" | "thick" | "thin" | {"any", "any"},
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        sort_by = "id", -- "id" | "extension" | "relative_directory" | "directory" | "tabs" | function(buffer_a, buffer_b) return buffer_a.modified > buffer_b.modified  end
        custom_areas = {
            right = function()
                local result = {}
                local error = vim.lsp.diagnostic.get_count(0, [[Error]])
                local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
                local info = vim.lsp.diagnostic.get_count(0, [[Information]])
                local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                end
                return result
            end
        }
    }
}

vim.api.nvim_set_keymap("n", "<M-d>", ":bd!<CR>", {noremap=true, silent=true})

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers", ":bnext and", ":bprevious will not respect the custom ordering
vim.api.nvim_set_keymap("n", "<space>]", ":BufferLineCycleNext<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<space>[", ":BufferLineCyclePrev<CR>", {noremap=true, silent=true})

-- These commands will move the current buffer backwards or forwards in the bufferline
vim.api.nvim_set_keymap("n", "<space>b]", ":BufferLineMoveNext<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<space>b[", ":BufferLineMovePrev<CR>", {noremap=true, silent=true})

-- These commands will sort buffers by directory, language, or a custom criteria
vim.api.nvim_set_keymap("n", "<space>be", ":BufferLineSortByExtension<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<space>bd", ":BufferLineSortByDirectory<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<space>bs", ":BufferLineSortByTabs<CR>", {noremap=true, silent=true})
-- vim.api.nvim_set_keymap("n", "bs", ":lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>", {noremap=true, silent=true})

-- Goto buffer in position...
vim.api.nvim_set_keymap("n", "<silent><space>1", "<Cmd>BufferLineGoToBuffer 1<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>2", "<Cmd>BufferLineGoToBuffer 2<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>3", "<Cmd>BufferLineGoToBuffer 3<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>4", "<Cmd>BufferLineGoToBuffer 4<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>5", "<Cmd>BufferLineGoToBuffer 5<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>6", "<Cmd>BufferLineGoToBuffer 6<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>7", "<Cmd>BufferLineGoToBuffer 7<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>8", "<Cmd>BufferLineGoToBuffer 8<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<silent><space>9", "<Cmd>BufferLineGoToBuffer 9<CR>", {noremap=true, silent=true})

vim.api.nvim_set_keymap("n", "<silent>    <Space>` :edit #<CR>", {noremap=true})
