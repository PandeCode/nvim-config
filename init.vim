source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/config/coc.vim

source $HOME/.config/nvim/config/telescope.vim

source $HOME/.config/nvim/config/vista.vim

source $HOME/.config/nvim/config/dashboard.vim

source $HOME/.config/nvim/config/barbar.vim
source $HOME/.config/nvim/config/lightline.vim

source $HOME/.config/nvim/config/theme.vim

source $HOME/.config/nvim/config/explorer.vim
source $HOME/.config/nvim/config/devicons.vim

source $HOME/.config/nvim/config/search.vim


source $HOME/.config/nvim/config/docReading.vim

source $HOME/.config/nvim/config/doge.vim

source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/bindings.vim

source $HOME/.config/nvim/config/vimspector.vim

source $HOME/.config/nvim/config/highlight.vim

source $HOME/.config/nvim/config/neoformat.vim

source $HOME/.config/nvim/config/go.vim
source $HOME/.config/nvim/config/ominisharp.vim

lua << EOF

require("config/rainbowIndex")

require( "config/echoDoc" )
require( "config/markdown" )
require( "config/godot" )
require( "config/treesitter" )

require ( "config/neovide")
require ( "config/cppmake")

EOF

set foldexpr=nvim_treesitter#foldexpr()


