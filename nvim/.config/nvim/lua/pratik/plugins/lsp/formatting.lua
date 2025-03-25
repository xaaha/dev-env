return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "biome", "prettier" },
				typescript = { "biome", "prettier" },
				javascriptreact = { "biome", "prettier" },
				typescriptreact = { "biome", "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "biome", "prettier" },
				yaml = { "yq", "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier", "biome" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "gofumpt", "golines", "goimports" },
				ruby = { "rubocop" },
				eruby = { "erb-format" },
				-- svelte = { "prettier" }, -- add as needed
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
