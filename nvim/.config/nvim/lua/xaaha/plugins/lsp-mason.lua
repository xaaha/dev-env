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
					package_installed = "󰄳",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			-- List of servers for mason to install
			ensure_installed = {
				-- "astro",
				-- "ts_ls",
				-- "html",
				-- "eslint",
				-- "cssls",
				-- "lua_ls",
				-- "graphql",
				-- "emmet_ls",
				-- "ruff",
				-- "gopls",
				-- "harper_ls",
				-- "jsonls",
				-- "ruby_lsp",
				-- "yamlls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
			automatic_enable = false, -- removes multiple lsp servers
		})

		local servers = {
			astro = "astro-language-server",
			ts_ls = "typescript-language-server",
			html = "html-lsp",
			eslint = "eslint-lsp",
			cssls = "css-lsp",
			lua_ls = "lua-language-server",
			graphql = "graphql-language-service-cli",
			emmet_ls = "emmet-ls",
			ruff = "ruff",
			gopls = "gopls",
			harper_ls = "harper-ls",
			jsonls = "json-lsp",
			ruby_lsp = "ruby-lsp",
			yamlls = "yaml-language-server",
		}

		vim.lsp.enable({
			"gopls",
			-- "harper_ls",
			"jsonls",
			"lua_ls",
			"ruff",
			"yamlls",
			-- from lspconfig
			"astro",
			"biome",
			"cssls",
			"emmet_ls",
			"eslint",
			"graphql",
			"html",
			"ruby_lsp",
			"ts_ls",
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"css-lsp",
				"eslint-lsp",
				"emmet-ls",
				"graphql-language-service-cli",
				"html-lsp",
				"harper-ls",
				"json-lsp",
				"typescript-language-server",
				"biome", -- JS, TS, TSX and JSON formatter, linter, and LSP
				"prettier", -- prettier formatter
				"astro-language-server",
				"lua-language-server",
				"stylua", -- lua formatter
				"ruby-lsp",
				"ruff", -- python lsp, linter, and formatter
				"mypy", -- python type checker
				"gopls",
				"gofumpt", -- go linters 👇
				"goimports",
				"golines",
				"postgrestools",
				"revive", -- go linters end,
				"standardrb", --  ruby linter and formatter
				"sqruff",
				"erb-lint", -- ruby end
				"yaml-language-server",
				"yamllint",
				"yq", -- yaml formatter
			},
		})
	end,
}
