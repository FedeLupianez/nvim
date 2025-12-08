return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
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
		enabled = true,
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
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {},
					wave = {},
					lotus = {},
					dragon = {},
					all = {
						ui = {
							bg_gutter = "none", -- set bg color for normal background
							bg_sidebar = "none", -- set bg color for sidebar like nvim-tree
							bg_float = "none", -- set bg color for floating windows
						},
					},
				},
				overrides = function(colors) -- add/modify highlights
					return {
						LineNr = { bg = "none" },
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						TelescopeNormal = { bg = "none" },
						TelescopeBorder = { bg = "none" },
						LspInfoBorder = { bg = "none" },
					}
				end,
				theme = "wave", -- Load "wave" theme
			})
		end,
	},

	{
		"catppuccin/nvim",
		enabled = false,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = true, -- disables setting the background color.
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
		},
	},
}
