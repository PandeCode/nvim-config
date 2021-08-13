-- Remove extensions jar?|epub|doc[xm]|xls[xmb]|pp[st][xm] from g:zipPlugin_ext
-- from Sep 13, 2016 and afterwards add back whenever converter unavailable

vim.g.zipPlugin_ext =
    "*.apk,*.celzip,*.crtx,*.ear,*.gcsx,*.glox,*.gqsx,*.kmz,*.oxt,*.potm,*.potx,*.ppam,*.sldx,*.thmx,*.vdw,*.war,*.wsz,*.xap,*.xlam,*.xlam,*.xltm,*.xltx,*.xpi,*.zip"

vim.g.loaded_gzip = true

vim.cmd "autocmd BufWritePre *.docx source $HOME/.config/nvim/vimscript/config/office.vim"
