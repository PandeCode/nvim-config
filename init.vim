source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/bindings.vim

lua << EOF

require ( "config/cppmake")
require ( "config/neovide")
require ( "plugins/barbar")
require ( "plugins/coc")
require ( "plugins/devicons")
require ( "plugins/docReading")
require ( "plugins/doge")
require ( "plugins/go")
require ( "plugins/lightline")
require ( "plugins/neoformat")
require ( "plugins/ominisharp")
require ( "plugins/search")
require ( "plugins/telescope")
require ( "plugins/theme")
require ( "plugins/vimspector")
require( "config/echoDoc" )
require( "config/godot" )
require( "config/markdown" )
require( "config/treesitter" )
require("config/rainbowIndex")


require ( "plugins/highlight")
require ( "plugins/explorer")
require ( "plugins/vista")
require ( "plugins/dashboard")

EOF

set foldexpr=nvim_treesitter#foldexpr()


