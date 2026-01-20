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
		vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#b0b0b0" })
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#3a3a3a", bold = true })

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
	 ██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ 
	 █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ 
	 █  █ █ ▀███▀           █  █   ▐    █  
	 █   ██                  █▐        ▀   
	                         ▐             
        ]]

		local header_val = vim.split(logo, "\n")

		-- Todo el logo en gris oscuro
		local header_hl = {}
		for i = 1, #header_val do
			table.insert(header_hl, {
				{ "AlphaGrayLight", 0, #header_val[i] },
			})
		end

		header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)

		dashboard.section.header.val = header_val
		dashboard.section.header.opts = {
			hl = header_hl,
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
		dashboard.section.buttons.val = {
			dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
			dashboard.button("f", "  Find file", ":lua Snacks.dashboard.pick('files')<CR>"),
			dashboard.button("g", "󰈞  Find text", ":lua Snacks.dashboard.pick('grep')<CR>"),
			dashboard.button("q", "  Quit", "<cmd>q<CR>"),
		}

		dashboard.section.buttons.opts = {
			hl = "AlphaButtons",
			position = "center",
		}

		----------------------------------------------------------------------
		-- STARTUP STATS
		----------------------------------------------------------------------
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			once = true,
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100

				local line = " Loaded " .. stats.count .. " plugins  in " .. ms .. " ms"

				-- calcular ancho del logo para centrar
				local logo_width = dashboard.section.header.val[1] and #dashboard.section.header.val[1] or #line

				local padding = math.max(0, math.floor((logo_width - #line) / 2))
				local centered_line = string.rep(" ", padding) .. line

				table.insert(dashboard.section.footer.val, " ")
				table.insert(dashboard.section.footer.val, centered_line)

				pcall(vim.cmd.AlphaRedraw)
			end,
		})

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
			dashboard.section.header,
			dashboard.section.greeting,

			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },

			dashboard.section.footer,
		}
		alpha.setup(dashboard.opts)
	end,
}
