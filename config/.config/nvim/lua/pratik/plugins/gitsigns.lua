return {
	"lewis6991/gitsigns.nvim",
	tag = "v0.9.0",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			vim.keymap.set("n", "<leader>G", ":Gitsigns<CR>", { desc = "Toggle Gitsigns selector" }),
			vim.keymap.set("n", "<leader>hl", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk in line" }),
			vim.keymap.set("n", "<leader>hr", ":Gitsigns diffthis<CR>", { desc = "Reset hunk" }),
		})
	end,
}
