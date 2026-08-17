-- WORKSPACE RULES
hl.workspace_rule({ workspace = "1", monitor = "DP-3" })
hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
hl.workspace_rule({ workspace = "3", monitor = "DP-2" })
hl.workspace_rule({ workspace = "4", monitor = "DP-3" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2" })

-- WINDOW RULES
hl.window_rule({
	workspace = 2,
	match = {
		class = "jetbrains-idea",
	},
})

hl.window_rule({
	workspace = 2,
	match = {
		class = "nvim",
	},
})

hl.window_rule({
	workspace = 1,
	match = {
		class = "kitty",
	},
})

hl.window_rule({
	workspace = 4,
	match = {
		class = "Signal",
	},
})

hl.window_rule({
	workspace = 3,
	match = {
		class = "zen-browser",
	},
})

hl.window_rule({
	workspace = 4,
	match = {
		class = "discord",
	},
})

hl.window_rule({
	workspace = 5,
	match = {
		class = "^(steam.*)$",
	},
	float = true,
	fullscreen = true,
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
