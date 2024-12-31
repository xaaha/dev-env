return {
	"lewis6991/gitsigns.nvim",
	tag = "v0.9.0",
	event = { "BufReadPre", "BufNewFile" },
	signcolumn = true,
	_signs_staged_enable = true, -- experimental
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				vim.api.nvim_buf_attach(bufnr, false, {
					on_lines = function()
						require("gitsigns").refresh()
					end,
				})
			end,
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
