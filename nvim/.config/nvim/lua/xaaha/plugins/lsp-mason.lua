return {
	"mason-org/mason.nvim",
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
			-- List of servers for mason to install
			ensure_installed = {
				"astro",
				"ts_ls",
				"html",
				"eslint",
				"cssls",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"ruff",
				"gopls",
				"harper_ls",
				"jsonls",
				"ruby_lsp",
				"yamlls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
			automatic_enable = false, -- removes multiple lsp servers
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"biome", -- JS, TS, TSX and JSON formatter, linter, and LSP
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"ruff", -- python lsp, linter, and formatter
				"mypy", -- python type checker
				"gofumpt", -- go linters 👇
				"goimports",
				"golines",
				"postgrestools",
				"revive", -- go linters end,
				"standardrb", --  ruby linter and formatter
				"sqruff",
				"erb-lint", -- ruby end
				"yamllint", -- yaml
				"yq", -- yaml formatter
			},
		})
	end,
}
