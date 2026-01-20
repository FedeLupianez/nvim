return {
	{
		"mason-org/mason.nvim",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "saghen/blink.cmp" },
		-- Mantenemos la lista de servidores a instalar.
		event = { "BufReadPre", "BufNewFile" },
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
	},
}
