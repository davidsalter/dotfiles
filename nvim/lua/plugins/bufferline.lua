return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		})
	end,
	keys = {
		{ "<C-h>", ":bprev<cr>", "Previous buffer" },
		{ "<C-l>", ":bnext<cr>", "Next buffer" },
		{ "<C-q>", ":bd<cr>", "Close buffer" },
	},
}
