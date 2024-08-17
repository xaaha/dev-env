return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	-- vim.keymap.set("n", "<leader>T", ":TestNearest<CR>", { desc = "Test nearest test" }),
	vim.keymap.set("n", "<leader>tt", ":TestFile<CR>", { desc = "Test this file" }),
	vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "Test entire suite" }),
	-- vim.keymap.set("n", "<leader>l", ":TestLast<CR>"),
	-- vim.keymap.set("n", "<leader>g", ":TestVisit<CR>"),
	vim.cmd("let test#strategy = 'vimux'"),
}
