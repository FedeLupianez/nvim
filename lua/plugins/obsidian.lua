return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = { "markdown" },
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		"BufReadPre ~/vault/*.md",
		"BufNewFile ~/vault/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/vault",
			},
		},
		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = "snacks.picker",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
		},
	},
	keys = {
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian search", mode = "n" },
		{ "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert template / follow link", mode = "n" },
		{ "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste img from clipboard", mode = "n" },
	},
}
