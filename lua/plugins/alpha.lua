-- Startup screen / navigation
return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local utils = require("alpha.utils")

		----------------------------------------------------------------------
		-- GRAYSCALE HIGHLIGHTS
		----------------------------------------------------------------------
		vim.api.nvim_set_hl(0, "AlphaGrayDark", { fg = "#3a3a3a" }) -- gris oscuro
		vim.api.nvim_set_hl(0, "AlphaGrayLight", { fg = "#b0b0b0" }) -- gris claro
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#b0b0b0" })
		local function set_colors()
			vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#b0b0b0", bold = true })
			vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaButtonShortcut", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaButtonText", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#3a3a3a" })
			vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaButtonShortcut", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaButtonText", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaGrayDark", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaDesc", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "AlphaGrayLight", { fg = "#b0b0b0" })
			vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#b0b0b0" })
		end

		_Gopts = {
			position = "center",
			hl = "Type",
			wrap = "overflow",
		}

		----------------------------------------------------------------------
		-- GREETING
		----------------------------------------------------------------------
		local function center_text(text, width)
			local text_width = vim.fn.strdisplaywidth(text)
			local padding = width - text_width
			local left = math.floor(padding / 2)
			local right = padding - left
			return string.rep(" ", left) .. text .. string.rep(" ", right)
		end

		local function getGreeting(name)
			local tableTime = os.date("*t")
			local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
			local hour = tableTime.hour

			local greetingsTable = {
				[1] = "  Sleep well",
				[2] = "  Good morning",
				[3] = "  Good afternoon",
				[4] = "  Good evening",
				[5] = "󰖔  Good night",
			}

			local greetingIndex
			if hour == 23 or hour < 7 then
				greetingIndex = 1
			elseif hour < 12 then
				greetingIndex = 2
			elseif hour < 18 then
				greetingIndex = 3
			elseif hour < 21 then
				greetingIndex = 4
			else
				greetingIndex = 5
			end

			local greetingLine = greetingsTable[greetingIndex] .. " " .. name

			-- ancho interno REAL
			local inner_width = math.max(vim.fn.strdisplaywidth(datetime), vim.fn.strdisplaywidth(greetingLine)) + 4

			local top = "╭─" .. center_text(datetime, inner_width) .. "─╮"
			local mid = "│ " .. center_text(greetingLine, inner_width) .. " │"
			local bot = "╰" .. string.rep("─", inner_width + 2) .. "╯"

			return { top, mid, bot }
		end

		----------------------------------------------------------------------
		-- LOGO
		----------------------------------------------------------------------
		local logo = [[


	   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█
	    █  █▀   ▀  █   █      █  ██ █ █ █
	██   █ ██▄▄    █   █ █     █ ██ █   █
	█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █
	█  █ █ ▀███▀           █  █   ▐    █
	█   ██                  █▐        ▀
	                        ▐
		      ]]

		local header_val = vim.split(logo, "\n")

		dashboard.section.header.val = header_val
		dashboard.section.header.opts = {
			hl = "AlphaGrayLight",
			position = "center",
		}

		----------------------------------------------------------------------
		-- GREETING LINE (centrado bajo el logo)
		----------------------------------------------------------------------
		local userName = "Fede"
		local greeting = getGreeting(userName)

		dashboard.section.greeting = {
			type = "text",
			val = vim.list_extend({ "" }, greeting),
			opts = {
				hl = "AlphaGrayLight",
				position = "center",
			},
		}

		dashboard.section.footer.val = {}

		dashboard.section.footer.opts = {
			hl = "AlphaGrayLight",
			position = "center",
		}

		----------------------------------------------------------------------
		-- BUTTONS
		----------------------------------------------------------------------
		local buttons = {
			type = "group",
			val = {
				{
					type = "button",
					val = "󱐥  Update plugins",
					on_press = function()
						vim.cmd("Lazy update")
					end,
					opts = {
						hl = "AlphaButton",
						hl_shortcut = "AlphaShortcut",
						keymap = { "n", "u", "<cmd>Lazy update<CR>", { noremap = true, silent = true } }, -- ¡AÑADIDO!
						position = "center",
						shortcut = "u",
						width = 40,
						align_shortcut = "right",
					},
				},
				{
					type = "button",
					val = "  Find file",
					on_press = function()
						vim.cmd("lua Snacks.picker.files()")
					end,
					opts = {
						hl = "AlphaButton",
						hl_shortcut = "AlphaShortcut",
						keymap = { "n", "f", ":lua Snacks.picker.files()<CR>", { noremap = true, silent = true } }, -- ¡AÑADIDO!
						position = "center",
						shortcut = "f",
						width = 40,
						align_shortcut = "right",
					},
				},
				{
					type = "button",
					val = "󰈞  Find text",
					on_press = function()
						vim.cmd("lua Snacks.picker.grep()")
					end,
					opts = {
						hl = "AlphaButton",
						hl_shortcut = "AlphaShortcut",
						keymap = { "n", "g", ":lua Snacks.picker.grep()<CR>", { noremap = true, silent = true } }, -- ¡AÑADIDO!
						position = "center",
						shortcut = "g",
						width = 40,
						align_shortcut = "right",
					},
				},
				{
					type = "button",
					val = "  Quit",
					on_press = function()
						vim.cmd("q")
					end,
					opts = {
						hl = "AlphaButton",
						hl_shortcut = "AlphaShortcut",
						keymap = { "n", "q", "<cmd>q<CR>", { noremap = true, silent = true } }, -- ¡AÑADIDO!
						position = "center",
						shortcut = "q",
						width = 40,
						align_shortcut = "right",
					},
				},
			},
			opts = {
				position = "center",
			},
		}

		----------------------------------------------------------------------
		-- CLEAN UI WHILE DASHBOARD IS OPEN
		----------------------------------------------------------------------
		local group = vim.api.nvim_create_augroup("CleanDashboard", {})

		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "AlphaReady",
			callback = function()
				vim.opt.showcmd = false
				vim.opt.ruler = false
				set_colors()
			end,
		})

		vim.api.nvim_create_autocmd("BufUnload", {
			group = group,
			pattern = "<buffer>",
			callback = function()
				vim.opt.showcmd = true
				vim.opt.ruler = true
			end,
		})

		dashboard.opts.opts.noautocmd = true
		dashboard.opts.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			dashboard.section.greeting,

			{ type = "padding", val = 2 },
			buttons,
		}
		alpha.setup(dashboard.opts)
	end,
	enabled = true,
}
