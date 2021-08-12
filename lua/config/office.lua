vim.cmd "source $HOME/.config/nvim/vimscript/config/office.vim"

-- Remove extensions jar?|epub|doc[xm]|xls[xmb]|pp[st][xm] from g:zipPlugin_ext
vim.g.zipPlugin_ext =
    "*.apk,*.celzip,*.crtx,*.ear,*.gcsx,*.glox,*.gqsx,*.kmz,*.oxt,*.potm,*.potx,*.ppam,*.sldx,*.thmx,*.vdw,*.war,*.wsz,*.xap,*.xlam,*.xlam,*.xltm,*.xltx,*.xpi,*.zip"
