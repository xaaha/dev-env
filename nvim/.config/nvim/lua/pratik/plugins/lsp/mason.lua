return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"eslint",
				"cssls",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"pyright", -- python
				"gopls",
				"jsonls",
				"ruby_lsp",
				"yamlls",
				-- "tailwindcss", -- examples
				-- "svelte",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"biome", -- JS, TS, TSX and JSON formatter, linter and LSP
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"ruff", -- python linter and formatter
				"mypy", -- python type checker
				"gofumpt", -- go linters 👇
				"goimports",
				"golines",
				"golangci-lint", -- go linters end,
				"rubyfmt",
				"rubocop", --  ruby linter and formatter
				"erb-lint", -- ruby end
				"yamllint", -- yaml
				"yq", -- yaml formatter
			},
		})
	end,
}
