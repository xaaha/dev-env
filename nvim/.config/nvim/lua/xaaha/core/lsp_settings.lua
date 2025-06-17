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
	"vtsls",
})

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

vim.diagnostic.config({
	-- virtual_lines = true, -- this gets messy on large code base with tons of errors
	-- Select either virtual lines or text below otherwise it gets messy
	virtual_text = {
		spacing = 4,
		prefix = "●", -- This is fine as a string
	},

	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

-- define common keybindings

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
	{
		"<leader>td",
		function()
			local is_enabled = vim.diagnostic.is_enabled()
			vim.diagnostic.enable(not is_enabled)
		end,
		"Toggle Diagnostics for this repo",
	},
}
-- set all keybindings
for _, mapping in ipairs(key_mappings) do
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", mapping[1], mapping[2], vim.tbl_extend("force", opts, { desc = mapping[3] }))
end

-- for ruby

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf

		-- Only do for Ruby files (optional, but recommended)
		local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
		if filetype ~= "ruby" then
			return
		end

		-- Enable formatting on save if supported
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp.format", { clear = false }),
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
