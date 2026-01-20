return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		lazy = true,
		opts = {
			ensure_installed = { "css", "svelte", "cpp", "python", "typescript", "lua" },
			auto_install = false,
			highlight = {
				enable = true, -- Habilitar Tree-sitter para resaltado de sintaxis
				additional_vim_regex_highlighting = false, -- Deshabilitar resaltado con expresiones regulares
			},
		},
	},
}
