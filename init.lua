-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.tabstop = 4 -- Número de espacios que ocupa el tab
vim.opt.shiftwidth = 4 -- Tamaño de indentación
vim.opt.encoding = "utf-8"
vim.opt.guicursor = ""
vim.o.winborder = "rounded"
vim.o.wrap = false
vim.o.swapfile = false
vim.opt.cursorline = false
vim.opt.loadplugins = true
vim.opt.shadafile = "NONE"
vim.loader.enable(true)

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

-- Blink.cmp colors
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#808081" })

vim.api.nvim_set_hl(0, "BlinkCmpItemAbbr", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine", { fg = "#808081" })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { fg = "#808081" })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { fg = "#808081" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#808081" })
vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "#ffffff" })

-- Snacks picker colors
-- vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#808081" })
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "NONE", fg = "#d5d0c9" })
vim.api.nvim_set_hl(0, "SnacksTitle", { bg = "NONE", fg = "#d5d0c9" })
vim.api.nvim_set_hl(0, "SnacksInputTitle", { bg = "NONE", fg = "#d5d0c9" })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewTitle", { bg = "NONE", fg = "#d5d0c9" })

vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#808081" })
