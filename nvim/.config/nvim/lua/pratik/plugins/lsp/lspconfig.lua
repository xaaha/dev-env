return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		}

		local function common_on_attach(_, bufnr) -- client, bufnr
			opts.buffer = bufnr
			local key_mappings = {
				{ "gr", "<cmd>FzfLua lsp_references<CR>", "Show LSP references" },
				{ "gD", "<cmd>FzfLua lsp_declarations<CR>", "Go to declaration" },
				{ "gd", "<cmd>FzfLua lsp_definitions<CR>", "Show LSP definitions" },
				{ "gi", "<cmd>FzfLua lsp_implementations<CR>", "Show LSP implementations" },
				{ "gt", "<cmd>FzfLua lsp_typedefs<CR>", "Show LSP type definitions" },
				{
					"<leader>ca",
					function()
						require("fzf-lua").lsp_code_actions({})
					end,
					"Code actions",
				},
				{ "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
				{ "<leader>D", "<cmd>FzfLua lsp_document_diagnostics<CR>", "Show buffer diagnostics" },
				{
					"<leader>d",
					function()
						vim.diagnostic.open_float({ border = "rounded" })
					end,
					"Show line diagnostics",
				},
				{
					"[d",
					function()
						vim.diagnostic.jump({ count = -1, float = true })
					end,
					"Go to previous diagnostic",
				},
				{
					"]d",
					function()
						vim.diagnostic.jump({ count = 1, float = true })
					end,
					"Go to next diagnostic",
				},
				{
					"K",
					function()
						vim.lsp.buf.hover({ border = border })
					end,
					"Show documentation",
				},
				{ "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
			}

			-- Set all keybindings
			for _, mapping in ipairs(key_mappings) do
				opts.desc = mapping[3]
				keymap.set("n", mapping[1], mapping[2], opts)
			end
		end

		-- Configure diagnostics (signs and virtual text)
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "●", -- This is fine as a string
			},
			float = {
				border,
			},
		})

		-- Configure border handlers for hover and signature help
		local handlers = {
			["textDocument/hover"] = function()
				vim.lsp.buf.hover({ border = border })
			end,
			["textDocument/signatureHelp"] = function()
				vim.lsp.buf.signature_help({ border = border })
			end,
		}

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
			},
		})

		-- List of LSP servers to configure
		local servers = {
			html = {},
			biome = {
				single_file_support = true,
				cmd = { "biome", "lsp-proxy" },
			},
			ts_ls = {
				settings = {
					jsx_close_tag = {
						enable = false,
						filetypes = { "javascriptreact", "typescriptreact" },
					},
				},
				on_attach = function(client, bufnr)
					common_on_attach(client, bufnr)
					-- -- Register TypeScript language server commands
					-- local commands = {
					-- 	_typescript_applyWorkspaceEdit = function(command)
					-- 		client.request("workspace/executeCommand", {
					-- 			command = command.command,
					-- 			arguments = command.arguments or {},
					-- 		})
					-- 	end,
					-- 	_typescript_goToSourceDefinition = function(command)
					-- 		client.request("workspace/executeCommand", {
					-- 			command = command.command,
					-- 			arguments = command.arguments or {},
					-- 		})
					-- 	end,
					-- }
					--
					-- client.commands = client.commands or {}
					-- for command_name, handler in pairs(commands) do
					-- 	client.commands[command_name] = handler
					-- end
				end,
			},
			eslint = {},
			cssls = {},
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
						format = { enable = true },
					},
				},
			},
			graphql = {
				filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			},
			emmet_ls = {
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
					"svelte",
					"eruby",
				},
			},
			pyright = {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
							useLibraryCodeForTypes = true,
							autoSearchPaths = true,
						},
					},
				},
			},
			gopls = {
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				cmd = { "gopls" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						gofumpt = true,
						completeUnimported = true,
						usePlaceholders = true,
						staticcheck = true,
						semanticTokens = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim", "Snacks" } },
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			},
			ruby_lsp = {},
			yamlls = {
				settings = {
					redhat = { telemetry = { enabled = false } },
					yaml = {
						keyOrdering = false,
						format = { enable = true },
						validate = true,
						schemaStore = { enable = false, url = "" },
					},
				},
				on_new_config = function(new_config)
					new_config.settings.yaml.schemas = vim.tbl_deep_extend(
						"force",
						new_config.settings.yaml.schemas or {},
						require("schemastore").yaml.schemas()
					)
				end,
			},
		}

		-- Setup LSP servers
		for server, config in pairs(servers) do
			lspconfig[server].setup(vim.tbl_deep_extend("force", {
				capabilities = capabilities,
				on_attach = config.on_attach or common_on_attach,
				handlers = handlers,
			}, config))
		end
	end,
}
