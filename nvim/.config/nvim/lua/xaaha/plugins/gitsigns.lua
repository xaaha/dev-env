-- inspiration
-- https://github.com/MariaSolOs/dotfiles/blob/bbf73a31c5ee255d0ad5b5a0981c5d4d6d0661f4/.config/nvim/lua/plugins/gitsigns.lua
return {
	"lewis6991/gitsigns.nvim",
	tag = "v0.9.0",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			preview_config = { border = "rounded" },
			vim.keymap.set("n", "<leader>G", ":Gitsigns<CR>", { desc = "Toggle Gitsigns selector" }),
			vim.keymap.set("n", "<leader>hl", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk in line" }),
			vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" }),
			vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" }),
			vim.keymap.set("n", "<leader>hd", ":Gitsigns diffthis<CR>", { desc = "Diff this page" }),
			vim.keymap.set("n", "<leader>hj", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" }),
			vim.keymap.set("n", "<leader>hb", ":Gitsigns blame_line<CR>", { desc = "Blame line" }),
		})
	end,
}
