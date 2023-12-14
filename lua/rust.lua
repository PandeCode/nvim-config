vim.cmd [[ set rtp+=~/.config/nvim/rust ]]

local librust = require("librust")

print( librust.add(1,2) )
