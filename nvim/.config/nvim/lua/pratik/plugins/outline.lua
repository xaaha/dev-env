return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>a", "<cmd>Outline<CR>", desc = "Toggle outline/aerial view" },
	},
	opts = {
		-- Your setup opts here
	},
}
