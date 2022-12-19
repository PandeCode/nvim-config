local spinners = {
	"dots",
	"dots_negative",
	"dots_snake",
	"dots_footsteps",
	"dots_hop",
	"line",
	"pipe",
	"dots_ellipsis",
	"dots_scrolling",
	"star",
	"flip",
	"hamburger",
	"grow_vertical",
	"grow_horizontal",
	"noise",
	"dots_bounce",
	"triangle",
	"arc",
	"circle",
	"square_corners",
	"circle_quarters",
	"circle_halves",
	"dots_toggle",
	"box_toggle",
	"arrow",
	"zip",
	"bouncing_bar",
	"bouncing_ball",
	"clock",
	"earth",
	"moon",
	"dots_pulse",
	"meter",
}


require"fidget".setup{
	text = {
		spinner = RandFrom(spinners)
	}
}
