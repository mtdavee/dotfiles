local copilot = require("copilot")
copilot.setup {
	suggestion = { enabled = false },
	panel = { enabled = false },
	server_opts_overrides = {
		trace = "verbose",
		settings = {
			advanced = {
				listCount = 10, -- #completions for panel
				inlineSuggestCount = 3, -- #completions for getCompletions
			}
		},
	}
}
