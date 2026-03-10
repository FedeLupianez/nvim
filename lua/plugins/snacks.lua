return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	---@type snacks.Config
	opts = {
		scroll = {
			enabled = false,
		},
		animations = {
			enabled = true,
		},
		picker = {
			event = "VimEnter",
			enabled = true,
		},
		image = {
			event = "VeryLazy",
			enabled = true,
		},
		dashboard = {
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				-- { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				--{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},

			preset = {
				-- 				header = [[
				-- ⠀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤
				-- ⠀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤
				-- ]],
				--
				header = [[
                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████  ███    ███ █████████ █████ █████ ████ █████ 
 ██████  █████████████████████  ████ █████ █████ ████ ██████
        ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
            --{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            --{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
            --{ icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
			},
			enabled = false,
		},
	},
	keys = {
		{ "<leader>sn", ":Snacks<cr>", desc = "Snacks" },
		{ "<leader>ff", ":lua Snacks.picker.files()<CR>", desc = "Find File" },
		{ "<leader>fg", ":lua Snacks.picker.grep()<CR>", desc = "Grep" },
		{ "gd", ":lua Snacks.picker.lsp_declarations()<CR>", desc = "Goto declaration" },
		{ "gD", ":lua Snacks.picker.lsp_definitions()<CR>", desc = "Goto definition" },
		{ "gI", ":lua Snacks.picker.lsp_implementations()<CR>", desc = "Goto implementation" },
	},
	enabled = true,
}
