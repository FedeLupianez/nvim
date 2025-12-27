return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		lazy = true,
		opts = {
			ensure_installed = { "css", "svelte", "cpp", "python", "typescript", "lua" },
			highlight = {
				enable = true, -- Habilitar Tree-sitter para resaltado de sintaxis
				disable = {}, -- No deshabilitar ningún lenguaje
				additional_vim_regex_highlighting = false, -- Deshabilitar resaltado con expresiones regulares
			},
		},
	},
}
