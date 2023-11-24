return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			vim.keymap.set("n", "<leader>G", ":Gitsigns<CR>", { desc = "Toggle Gitsigns selector" }),
		})
	end,
}
