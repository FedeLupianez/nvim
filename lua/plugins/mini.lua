return {
	{
		"nvim-mini/mini.animate",
		enabled = false,
	},
	{
		"nvim-mini/mini.nvim",
		enabled = false,
	},
	{
		"nvim-mini/mini.splitjoin",
		version = false,
		config = function()
			require("mini.splitjoin").setup({})
		end,
	},
}
