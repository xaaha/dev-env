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

		local servers = {
			-- lspconfigName :h lspconfig-all = to Mason package name often "official tool name"
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

		local linter_and_formatters = {
			"prettier", -- Prettier formatter
			"stylua", -- Lua formatter
			"mypy", -- Python type checker
			"gofumpt", -- Go formatter
			"goimports",
			"golines",
			"postgrestools",
			"revive", -- Go linter
			"standardrb", -- Ruby linter
			"sqruff", -- SQL formatter
			"erb-lint", -- Ruby templating linter "yamllint", -- YAML linter
			"yq", -- YAML formatter
		}

		-- Collect all mason tool names from LSPs
		local serversToInstall = {}
		local serversToEnable = {}
		local exclude = {
			"harper_ls",
		}

		for lsp, tool in pairs(servers) do
			table.insert(serversToInstall, tool)
			if not vim.tbl_contains(exclude, lsp) then
				table.insert(serversToEnable, lsp)
			end
		end

		-- Append extra tools to the install list
		vim.list_extend(serversToInstall, linter_and_formatters)

		-- Mason tool installer requires official name (mason package name) not lspconfig name
		mason_tool_installer.setup({
			ensure_installed = serversToInstall,
		})

		-- Enable the LSP servers
		vim.lsp.enable(serversToEnable)
	end,
}
