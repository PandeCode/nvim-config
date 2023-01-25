vim.api.nvim_set_keymap(Keys.NoneStr, "<C-u>", "<CMD>UndotreeToggle<CR>", Keys.Noremap)
vim.api.nvim_set_keymap(Keys.NoneStr, "<leader>u", "<CMD>UndotreeToggle<CR>", Keys.Noremap)

-- Window layout
-- style 1
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+                        |
-- |          |                        |
-- |   diff   |                        |
-- |          |                        |
-- +----------+------------------------+
-- Style 2
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+------------------------+
-- |                                   |
-- |   diff                            |
-- |                                   |
-- +-----------------------------------+
-- Style 3
-- +------------------------+----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- |                        +----------+
-- |                        |          |
-- |                        |   diff   |
-- |                        |          |
-- +------------------------+----------+
-- Style 4
-- +-----------------------++----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- +------------------------+----------+
-- |                                   |
-- |                            diff   |
-- |                                   |
-- +-----------------------------------+
let g:undotree_WindowLayout = 1

-- e.g. using 'd' instead of 'days' to save some space.
if !exists('g:undotree_ShortIndicators')
    let g:undotree_ShortIndicators = 0
endif

-- undotree window width
if !exists('g:undotree_SplitWidth')
    if g:undotree_ShortIndicators == 1
        let g:undotree_SplitWidth = 24
    else
        let g:undotree_SplitWidth = 30
    endif
endif

-- diff window height
let g:undotree_DiffpanelHeight = 10

-- auto open diff window
if !exists('g:undotree_DiffAutoOpen')
    let g:undotree_DiffAutoOpen = 1
endif

-- if set, let undotree window get focus after being opened, otherwise
-- focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 0
endif

-- tree node shape.
if !exists('g:undotree_TreeNodeShape')
    let g:undotree_TreeNodeShape = '*'
endif

-- tree vertical shape.
if !exists('g:undotree_TreeVertShape')
    let g:undotree_TreeVertShape = '|'
endif

-- tree split shape.
if !exists('g:undotree_TreeSplitShape')
    let g:undotree_TreeSplitShape = '/'
endif

-- tree return shape.
if !exists('g:undotree_TreeReturnShape')
    let g:undotree_TreeReturnShape = '\'
endif

if !exists('g:undotree_DiffCommand')
    let g:undotree_DiffCommand = "diff"
endif

-- relative timestamp
if !exists('g:undotree_RelativeTimestamp')
    let g:undotree_RelativeTimestamp = 1
endif

-- Highlight changed text
if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 1
endif

-- Highlight changed text using signs in the gutter
if !exists('g:undotree_HighlightChangedWithSign')
    let g:undotree_HighlightChangedWithSign = 1
endif

-- Highlight linked syntax type.
-- You may chose your favorite through ":hi" command
if !exists('g:undotree_HighlightSyntaxAdd')
    let g:undotree_HighlightSyntaxAdd = "DiffAdd"
endif
if !exists('g:undotree_HighlightSyntaxChange')
    let g:undotree_HighlightSyntaxChange = "DiffChange"
endif
if !exists('g:undotree_HighlightSyntaxDel')
    let g:undotree_HighlightSyntaxDel = "DiffDelete"
endif

-- Deprecates the old style configuration.
if exists('g:undotree_SplitLocation')
    echo "g:undotree_SplitLocation is deprecated,
                \ please use g:undotree_WindowLayout instead."
endif

-- Show help line
if !exists('g:undotree_HelpLine')
    let g:undotree_HelpLine = 1
endif

-- Show cursorline
    let g:undotree_CursorLine = 1
