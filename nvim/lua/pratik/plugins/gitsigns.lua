return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			vim.keymap.set("n", "<leader>G", ":Gitsigns<CR>", { desc = "Toggle Gitsigns selector" }),
			vim.keymap.set("n", "<leader>hl", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk in line" }),
			vim.keymap.set("n", "<leader>hf", ":Gitsigns diffthis<CR>", { desc = "Preview hunk in line" }),
		})
	end,
}
