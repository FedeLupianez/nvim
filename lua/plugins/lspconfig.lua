return {
	{
		"neovim/nvim-lspconfig",
		-- La configuración de este plugin se ha movido a lua/plugins/lsp.lua
	},
	{
		"mason-org/mason.nvim",
		-- Mason es una dependencia y se carga automáticamente.
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
		-- La función `config` ha sido eliminada para evitar conflictos.
		-- La lógica ahora está en lua/plugins/lsp.lua
	},
}
