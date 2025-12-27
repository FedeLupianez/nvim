return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- Activar inlay hints globalmente.
			inlay_hints = {
				enabled = true,
			},

			-- Configuraciones de servidores.
			servers = {
				-- APLICA A TODOS LOS SERVIDORES:
				["*"] = {
					capabilities = require("blink.cmp").get_lsp_capabilities(),
				},

				-- CONFIGURACIONES ESPECÍFICAS:
				vtsls = {
					settings = {
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
					},
				},
				clangd = {
					-- Se elimina la función `root_dir` para permitir que lspconfig
					-- use su método de detección de raíz por defecto, que es más flexible
					-- y soluciona el problema de que no se inicie en proyectos sin
					-- 'compile_commands.json'.
					cmd = { "clangd", "--background-index", "-j=12", "--fallback-style=webkit" },
				},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				},
				astro = {
					on_attach = function(client, bufnr)
						client.server_capabilities.documentFormattingProvider = false
					end,
				},
			},
		},
	},
}
