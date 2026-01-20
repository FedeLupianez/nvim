return {
	{
		"mfussenegger/nvim-dap",
		cmd = {
			"DapContinue",
			"DapToggleBreakpoint",
			"DapStepOver",
			"DapStepInto",
			"DapTerminate",
		},
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")

			-- virtual text: lazy real (solo al iniciar debug)
			dap.listeners.after.event_initialized["dap_virtual_text"] = function()
				require("nvim-dap-virtual-text").setup()
			end

			-- UI solo durante debug
			dap.listeners.after.event_initialized["dapui"] = function()
				require("dapui").open()
			end
			dap.listeners.before.event_terminated["dapui"] = function()
				require("dapui").close()
			end
			dap.listeners.before.event_exited["dapui"] = function()
				require("dapui").close()
			end

			-- Adapter C/C++
			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
					MIMode = "gdb",
					MIDebuggerPath = "/usr/bin/gdb",
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		cmd = { "Mason" },
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-nvim-dap").setup({
				automatic_installation = true,
			})
		end,
	},
}
