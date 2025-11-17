-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.tabstop = 3 -- Número de espacios que ocupa el tab
vim.opt.shiftwidth = 3 -- Tamaño de indentación
vim.opt.guicursor = ""
vim.o.winborder = "rounded"
vim.o.wrap = false
vim.o.swapfile = false

vim.opt.updatetime = 300 -- Reduce el tiempo de espera para eventos
vim.diagnostic.config({ virtual_text = true })

vim.o.shell = "zsh"
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.ino",
	callback = function()
		vim.bo.filetype = "cpp"
	end,
})
vim.opt.spell = true
vim.opt.spelllang = { "en", "es" }
vim.treesitter.language.register("json", "jsonc")
