return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "saghen/blink.cmp" },
		-- Mantenemos la lista de servidores a instalar.
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
