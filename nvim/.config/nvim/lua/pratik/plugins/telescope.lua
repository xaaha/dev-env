return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local open_with_trouble = require("trouble.sources.telescope").open

		telescope.setup({
			pickers = {
				oldfiles = {
					cwd_only = true, -- show old/recent files of the cwd only.
				},
			},
			defaults = {
				path_display = { "truncate " },
				file_ignore_patterns = {
					"node_modules",
					"build",
					"dist",
					"yarn.lock",
					".git/",
				},
				selection_caret = "→ ",
				prompt_prefix = "🔭 ",
				-- sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						-- prompt_position = "top",
						preview_width = 0.50,
						-- results_width = 0.9,
					},
					vertical = {
						mirror = false,
					},
					width = 0.9,
					height = 0.9,
					preview_cutoff = 120,
				},
				vimgrep_arguments = {
					"rg",
					"--no-ignore",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<c-t>"] = open_with_trouble,
					},
					n = {
						["<c-t>"] = open_with_trouble,
						["d"] = require("telescope.actions").delete_buffer,
						["q"] = require("telescope.actions").close,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set(
			"n",
			"<c-b>",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<cr>",
			{ desc = "Find open buffers" }
		)
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd, exclude hidden" })

		-- Disabling these keymaps and experimenting with fzf lua

		-- keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		-- keymap.set("n", "<leader>fg", function()
		-- 	require("telescope.builtin").live_grep({
		-- 		additional_args = function()
		-- 			return { "--hidden", "-g", "!.git" }
		-- 		end,
		-- 	})
		-- end, { desc = "Grep in all files, including hidden, exclude .git" })

		-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

		keymap.set(
			"n",
			"<leader>ff",
			"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
			{ desc = "Find all files (including hidden) in cwd" }
		)
		keymap.set(
			"n",
			"<leader>fw",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Grep in current buffer" }
		)
		keymap.set(
			"n",
			"<leader>fe",
			"<cmd>Telescope live_grep grep_open_files=true<cr>",
			{ desc = "Grep in recent buffers" }
		)
	end,
}
