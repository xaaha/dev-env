return {
	"mason-org/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "󰄳 ",
					package_pending = " ",
					package_uninstalled = " ",
				},
			},
		})

		-- Mapping of lspconfig name (dimmed name in Mason UI) => mason package name
		-- dimmed name is required if you want to use the name to enable the config declared in the lspconfig
		local servers = {
			biome = "biome", -- JS/TS formatter/linter/LSP
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
			ensure_installed = serversToInstall,
		})
	end,
}
