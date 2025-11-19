return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				enable = true, -- boolean: enable transparent
				extra_groups = { -- table/string: additional groups that should be cleared
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"EndOfBuffer",
				},
				exclude = {}, -- table: groups you don't want to clear
			})
			vim.cmd("TransparentEnable") -- execute the command to enable transparency
		end,
		enabled = false,
	},

	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- Default options:
			require("kanagawa").setup({
				compile = true, -- enable compiling the colorscheme
				undercurl = false, -- enable undercurls
				commentStyle = { italic = false },
				functionStyle = { bold = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = false, -- define vim.g.terminal_color_{0,17}
			})
		end,
	},

	{
		"catppuccin/nvim",
		enabled = false,
	},
	-- example lazy.nvim install setup
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local lackluster = require("lackluster")
			local color = lackluster.color
			lackluster.setup({
				tweak_syntax = {
					string = color.yellow,
				},
			})
		end,
	},
}
