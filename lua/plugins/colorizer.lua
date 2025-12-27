return {
	"norcalli/nvim-colorizer.lua",
	event = "BufEnter",
	lazy = true,
	config = function()
		require("colorizer").setup()
	end,
}
