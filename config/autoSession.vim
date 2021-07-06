let g:auto_session_root_dir = "$HOME/.config/nvimSessions"

" or use lua
lua << EOF
local opts = {
		log_level = 'info',
		auto_session_enable_last_session = false,
		auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
		auto_session_enabled = true,
		auto_save_enabled = nil,
		auto_restore_enabled = nil,
		auto_session_suppress_dirs = nil
		}

require('auto-session').setup(opts)
EOF
