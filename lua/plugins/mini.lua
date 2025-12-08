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
	{
		"nvim-mini/mini.pairs",
		enabled = false,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{ "nvim-mini/mini.files", version = false, lazy = false, enabled = false },
}
