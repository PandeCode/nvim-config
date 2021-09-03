require("nvim-autopairs").setup {
    disable_filetype = {"TelescopePrompt"},
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    enable_afterquote = true,
    -- add bracket pairs after quote,
    enable_check_bracket_line = true
}

require("nvim-autopairs.completion.compe").setup(
    {
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` after select function or method item
        auto_select = false -- auto select first item
    }
)

local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")

npairs.add_rule(Rule("$$", "$$", "tex"))

-- you can use some built-in condition

local cond = require("nvim-autopairs.conds")
--print(vim.inspect(cond))

npairs.add_rules(
    {
        Rule("$", "$", {"tex", "latex"}):with_pair(cond.not_after_regex_check("%%")):with_pair(
            -- don't add a pair if the next character is %
            -- don't add a pair if  the previous character is xxx
            cond.not_before_regex_check("xxx", 3)
        ):with_move(cond.none()):with_del(cond.not_after_regex_check("xx")):with_cr(cond.none())
        -- don't move right when repeat character
        -- don't delete if the next character is xx
        -- disable  add newline when press <cr>
    }
)

npairs.add_rules(
    {
        Rule("$$", "$$", "tex"):with_pair(
            function(opts)
                print(vim.inspect(opts))
                if opts.line == "aa $$" then
                    -- don't add pair on that line
                    return false
                end
            end
        )
    }
)

-- you can use regex
--  press u1234 => u1234number
npairs.add_rules(
    {
        Rule("u%d%d%d%d$", "number", "lua"):use_regex(true)
    }
)

--  press x1234 => x12341234
npairs.add_rules(
    {
        Rule("x%d%d%d%d$", "number", "lua"):use_regex(true):replace_endpair(
            function(opts)
                -- print(vim.inspect(opts))
                return opts.prev_char:sub(#opts.prev_char - 3, #opts.prev_char)
            end
        )
    }
)

-- you can do anything with regex +special key
-- example press tab will upper text
-- press b1234s<tab> => B1234S1234S

npairs.add_rules(
    {
        Rule("b%d%d%d%d%w$", "", "vim"):use_regex(true, "<tab>"):replace_endpair(
            function(opts)
                return opts.prev_char:sub(#opts.prev_char - 4, #opts.prev_char) .. "<esc>viwU"
            end
        )
    }
)

-- you can exclude filetypes
npairs.add_rule(Rule("$$", "$$"):with_pair(cond.not_filetypes({"lua"})))
--- check ./lua/nvim-autopairs/rules/basic.lua
