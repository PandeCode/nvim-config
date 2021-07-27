vim.cmd(
    [[
if exists('g:neovide')
		" --multiGrid
		" let g:neovide_refresh_rate=140
		" let g:neovide_no_idle=v:true
		" let g:neovide_cursor_animation_length=0.13
		" let g:neovide_cursor_trail_length=0.8
		" let g:neovide_cursor_antialiasing=v:true
		" let g:neovide_cursor_vfx_opacity=200.0
		" let g:neovide_cursor_vfx_prticle_lifetime=1.2
		" let g:neovide_cursor_vfx_particle_density=7.0
		" let g:neovide_cursor_vfx_particle_speed=10.0
		" let g:neovide_cursor_vfx_particle_phase=1.5
		" let g:neovide_cursor_vfx_particle_curl=1.0

		let g:neovide_transparency = 0.9
		let g:neovide_cursor_vfx_mode = "railgun" " 'railgun' | 'torpedo' | 'pixiedust' | 'sonicboom' | 'ripple' | 'wireframe'

		autocmd VimEnter * unmap <F4>
endif
]]
)
