return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
	},
	{
		"mason-org/mason.nvim",
		lazy = false,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },
		opts = {
			ensure_installed = {
				"vtsls",
				"pyright",
				"svelte",
				"lua_ls",
				"clangd",
				"tailwindcss",
				"ruff",
			},
		},

		config = function()
			local lazy_setup = {
				pyright = { "python" },
				vtsls = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
				svelte = { "svelte" },
				lua_ls = { "lua" },
				rust_analyzer = { "rust" },
			}

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.clangd.setup({
				capabilities = capabilities,
				filetypes = { "c", "cpp", "objc", "objcpp", "arduino" },
				-- cmd = { "clangd", "--compile-commands-dir=." },
				cmd = { "clangd", "--background-index", "-j=12", "--fallback-style=webkit" },
				root_dir = require("lspconfig.util").root_pattern("platformio.ini", "compile_commands.json"),
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "clippy", -- o "check"
						},
					},
				},
			})

			for server, file_types in pairs(lazy_setup) do
				local opts = { capabilities = capabilities, filetypes = file_types }

				if server == "vtsls" then
					opts.settings = {
						typescript = {
							inlayHints = {
								enabled = true,
							},
							referencesCodeLens = {
								enabled = true,
							},
						},
						experimental = {
							documentHighlight = true,
						},
					}
				end
				lspconfig[server].setup(opts)
			end
		end,
	},
}
